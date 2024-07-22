import 'package:gaslocator/enums/user_type.dart';

class UserRegistrationRequest {
  final String name;
  final String email;
  final bool isClient;

  UserRegistrationRequest({
    required this.name,
    required this.email,
    required this.isClient,
  });

  Map<String, dynamic> toClientMap() => {
        "user name": name,
        "email": email,
        "user type": UserType.client.name,
        "booking": 0,
        "book timeout": 0,
      };
  Map<String, dynamic> toOwnerMap() => {
        "user name": name,
        "email": email,
        "user type": UserType.owner.name,
      };
}
