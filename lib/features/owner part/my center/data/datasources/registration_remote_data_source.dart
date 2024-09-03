import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gaslocator/enums/center_status.dart';
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
      List gases = [
        "Abarsi",
        "Ajeb",
        "Alnahla",
        "Alnile",
        "Alterifi",
        "Alwatania",
        "Aman",
        "Benta",
        "Gadra",
        "Iran",
        "Sodagas",
        "Sondos"
      ];
      List gas = [];
      for (int i = 0; i < gases.length; i++) {
        gas.add({
          "name": gases[i],
          "available quantity": 0,
          "is exist": false,
          "booked quantity": 0,
        });
      }
      FirebaseFirestore.instance.collection("centers").doc(id).set({
        "center name": "",
        "location": [null, null],
        "gas": gas,
        "cancel": 4,
        "status": CenterStatus.close.name,
        "phone number": null,
        "owner id": id,
      });
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
