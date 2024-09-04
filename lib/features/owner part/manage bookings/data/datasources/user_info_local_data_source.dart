import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/utils/app_strings.dart';

abstract class UserInfoLocalDataSource {
  bool getLastInfo();
  Future<void> cacheInfo(User user);
}

class RandomQuoteLocalDataSourceImpl implements UserInfoLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  bool getLastInfo() {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString != null) {
      //  final cacheRandomQuote =
      //   Future.value(User.fromJson(json.decode(jsonString)));
      return true; //cacheRandomQuote;
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
