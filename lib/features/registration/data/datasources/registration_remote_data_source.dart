import 'package:gaslocator/core/api/firebase_consumer.dart';

abstract class RegistrationRemoteDataSource {
  Future<bool> login({required String password, required String email});
  Future<bool> signup({required String password, required String email});
}

class RegistrationRemoteDataSourceImpl implements RegistrationRemoteDataSource {
  FirebaseConsumer firebaseConsumer;
  RegistrationRemoteDataSourceImpl({
    required this.firebaseConsumer,
  });

  @override
  Future<bool> login({required String password, required String email}) async {
    return await firebaseConsumer.login(password: password, email: email);
  }

  @override
  Future<bool> signup({required String password, required String email}) async {
    return await firebaseConsumer.signup(password: password, email: email);
  }
}
