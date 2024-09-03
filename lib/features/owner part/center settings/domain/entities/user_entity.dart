import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final bool isAuth;
  final String type;

  const UserEntity(
      {required this.name,
      required this.email,
      required this.isAuth,
      required this.type});
  @override
  List<Object?> get props => [name, email, isAuth, type];
}
