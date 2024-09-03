//  class UserEntity {
//   final String name;
//   final String email;
//   final String type;
//   User(this.name, this.email, this.type);

//   Map<String, dynamic> toMap();
// }

// class Customer extends User {
//   Customer(String name, String email, String type) : super(name, email, type);

//   @override
//   Map<String, dynamic> toMap() => {
//         "user name": name,
//         "email": email,
//         "user type": "customer",
//         "booking": 0,
//         "book timeout": 0,
//       };
// }

// class Owner extends User {
//   Owner(String name, String email , String type) : super(name, email, type);

//   @override
//   Map<String, dynamic> toMap() => {
//         "user name": name,
//         "email": email,
//         "user type": "owner",
//       };
// }
