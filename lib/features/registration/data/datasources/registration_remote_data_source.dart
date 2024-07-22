import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gaslocator/features/registration/domain/entities/request/user_registration_request.dart';

abstract class RegistrationRemoteDataSource {
  Future<bool> login({required String password, required String email});
  Future<bool> signup(
      {required String password,
      required String email,
      required UserRegistrationRequest user});
}

class RegistrationRemoteDataSourceImpl implements RegistrationRemoteDataSource {
  @override
  Future<bool> signup(
      {required String password,
      required String email,
      required UserRegistrationRequest user}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    final id = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("user")
        .doc(id)
        .set(user.isClient ? user.toClientMap() : user.toOwnerMap());
    if (!user.isClient) {
      await FirebaseFirestore.instance.collection("office").doc(id).set({});
    }
    return true;
  }

  @override
  Future<bool> login({required String password, required String email}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (userCredential.user!.emailVerified == false) {
      User? user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      return false;
    } else {
      return true;
    }
  }

  resetPassword({required String passWord}) {}
}
