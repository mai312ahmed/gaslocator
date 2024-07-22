enum UserType { owner, client }

extension UserTypeX on UserType {
  String get name {
    switch (this) {
      case UserType.client:
        return 'client';

      case UserType.owner:
        return 'owner';
    }
  }
}
