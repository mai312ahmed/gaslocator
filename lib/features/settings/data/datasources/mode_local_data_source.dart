import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/app_strings.dart';

abstract class ModeLocalDataSource {
  Future<bool> changeMode({required String mode});
  Future<String> getSavedMode();
}

class ModeLocalDataSourceImpl implements ModeLocalDataSource {
  final SharedPreferences sharedPreferences;
  ModeLocalDataSourceImpl({
    required this.sharedPreferences,
  });
  @override
  Future<bool> changeMode({required String mode}) async =>
      await sharedPreferences.setString(AppStrings.mode, mode);

  @override
  Future<String> getSavedMode() async {
    bool isExist = sharedPreferences.containsKey(AppStrings.mode);
    return isExist
        ? sharedPreferences.getString(AppStrings.locale)!
        : AppStrings.englishCode;
  }
}
