import 'package:gaslocator/features/registration/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String type,
    required String userName,
    required String id,
    required String email,
    final String? phone,
    final String? centerName,
    final List<String>? location,
    final String? attestationCertification,
  }) : super(
            userName: userName,
            type: type,
            id: id,
            email: email,
            phone: phone,
            centerName: centerName,
            location: location,
            attestationCertification: attestationCertification);

  factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
      email: data["email"],
      id: data["id"],
      type: data["type"],
      userName: data["userName"],
      phone: data["phone"],
      centerName: data["centerName"],
      location: data["location"],
      attestationCertification: data["attestationCertification"]);
  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "type": type,
        "userName": userName,
        "phone": phone,
        "centerName": centerName,
        "location": location,
        "attestationCertification": attestationCertification,
      };
}
