import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String type;
  final String userName;
  final String? phone;
  final String? centerName;
  final List<String>? location;
  final String? attestationCertification;
  const User({
    this.attestationCertification,
    required this.type,
    required this.userName,
    this.centerName,
    required this.id,
    required this.email,
    this.phone,
    this.location,
  });

  @override
  List<Object?> get props => [id, email, phone];
}
