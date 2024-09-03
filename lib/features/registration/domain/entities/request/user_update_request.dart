import 'package:gaslocator/enums/user_type.dart';

class UserUpdateRequest {
  final String? name;
  final String? email;
  final String? type;
  final int? booking;
  final int? bookTimeout;
  UserUpdateRequest({
    this.name,
    this.email,
    this.type,
    this.bookTimeout,
    this.booking,
  });

  Map<String, dynamic> toUpdateMap() => {
        "user name": name,
        "email": email,
        "user type": UserType.client.name,
        "booking": booking,
        "book timeout": bookTimeout,
      };
}
