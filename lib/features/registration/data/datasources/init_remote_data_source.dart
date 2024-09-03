import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gaslocator/features/registration/domain/entities/request/user_update_request.dart';
import 'package:gaslocator/features/settings/domain/entities/user_entity.dart';

abstract class InitRemoteDataSource {
  Future<bool> updateUserInfo({required UserUpdateRequest user});
  Future<UserEntity?> getSavedUserInfo();
}

class InitRemoteDataSourceImpl implements InitRemoteDataSource {
  @override
  Future<UserEntity?> getSavedUserInfo() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var userInfo;
      await FirebaseFirestore.instance
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        userInfo = value;
      });

      return UserEntity(
        name: userInfo.data()!["user name"],
        email: userInfo.data()!["email"],
        type: userInfo.data()!["user type"],
        isAuth: true,
      );
    }
    return null;
  }

  @override
  Future<bool> updateUserInfo({required user}) async {
    try {
      var updatMap = user.toUpdateMap();
      updatMap.removeWhere(((key, value) => value == null));
      await FirebaseFirestore.instance
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(updatMap);
      return true;
    } catch (e) {
      return false;
    }
  }
}
