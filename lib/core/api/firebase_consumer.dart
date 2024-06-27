import 'package:firebase_auth/firebase_auth.dart';

class FirebaseConsumer {
  post() {}
  update() {}
  delete() {}
  get() {}
  put() {}
  signup({required String password, required String email}) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "mai96oda@gmail.com", password: "baraa123");
    return true;
  }

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
