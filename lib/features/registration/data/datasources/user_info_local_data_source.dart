import 'dart:convert';
import 'package:gaslocator/features/registration/data/models/user_model.dart';
import 'package:gaslocator/features/registration/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/app_strings.dart';

abstract class UserInfoLocalDataSource {
  Future<User> getLastInfo();
  Future<void> cacheInfo(User user);
}

class RandomQuoteLocalDataSourceImpl implements UserInfoLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserModel> getLastInfo() {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString != null) {
      final cacheRandomQuote =
          Future.value(UserModel.fromJson(json.decode(jsonString)));
      return cacheRandomQuote;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheInfo(User user) {
    return sharedPreferences.setString(
        AppStrings.cachedRandomQuote, json.encode(user));
  }
}
