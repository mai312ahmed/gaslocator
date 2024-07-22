class UserModel {
  final String type;
  final String name;
  final String email;
  final String? phone;
  final String? centerName;
  final List<String>? location;

  // factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
  //     email: data["email"],
  //     type: data["type"],
  //     name: data["userName"],
  //     phone: data["phone"],
  //     centerName: data["centerName"],
  //     location: data["location"],
  //     );

  UserModel({
    required this.type,
    required this.name,
    required this.email,
    required this.phone,
    required this.centerName,
    required this.location,
  });
  Map<String, dynamic> toJson() => {
        "email": email,
        "type": type,
        "userName": name,
        "phone": phone,
        "centerName": centerName,
        "location": location,
      };
}
