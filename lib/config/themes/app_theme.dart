import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/values_manager.dart';

ThemeData appTheme() {
  return ThemeData(
    //main color
    primaryColor: AppColors.primaryLight,
    primaryColorDark: AppColors.primaryDark,
    primaryColorLight: AppColors.primaryLight,
    disabledColor: Colors.grey,
    splashColor: AppColors.primaryLight, //button shadow
    hintColor: AppColors.lines,
    scaffoldBackgroundColor: AppColors.primaryLight,
    fontFamily: AppStrings.fontFamily,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: AppColors.primaryLight,
    ),

    //cardview theme
    cardTheme: const CardTheme(
      color: Colors.white,
      shadowColor: Colors.grey,
      elevation: AppSize.s4,
    ),
    //app  bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
        shadowColor: AppColors.background,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w500, color: Colors.white, fontSize: 20)),
    //button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: Colors.grey,
      buttonColor: AppColors.primaryLight,
      splashColor: AppColors.primaryLight,
    ),
//elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          backgroundColor: AppColors.primaryLight,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12))),
    ),
    //Text theme
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: AppColors.primaryDark,
      ),
      displayLarge: const TextStyle(
        color: Colors.black26,
      ),
      displayMedium: const TextStyle(
        color: Colors.black26,
      ),
      // titleMedium: TextStyle(color: AppColors.light, fontSize: 16),
      bodySmall: TextStyle(
        color: AppColors.primaryDark,
      ),
      bodyLarge: TextStyle(
        color: AppColors.primaryDark,
      ),
      bodyMedium:
          TextStyle(color: AppColors.lines, fontWeight: FontWeight.bold),
    ),
    //input decoration theme (textFormField)
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.primaryDark,
      hoverColor: AppColors.primaryDark,
      prefixIconColor: AppColors.primaryDark,
      suffixIconColor: AppColors.primaryDark,
      fillColor: Colors.white,
      filled: true,
      //content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
//hint style
      hintStyle: TextStyle(
        color: AppColors.lines,
      ),
// lable
      labelStyle: TextStyle(
        color: AppColors.primaryDark,
      ),
//error style
      errorStyle: const TextStyle(
        color: Colors.red,
      ),
//enable border style
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
//focus border style
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: AppColors.lines,
        width: 1.5,
      )),
//error border style
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
//focus error border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryLight, width: 1.5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
    ),
  );
}
