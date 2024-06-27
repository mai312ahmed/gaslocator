import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/values_manager.dart';

ThemeData appTheme() {
  return ThemeData(
    //main color
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primary,
    primaryColorLight: AppColors.primary,
    disabledColor: Colors.grey,
    splashColor: AppColors.light, //button shadow
    hintColor: AppColors.light,
    scaffoldBackgroundColor: AppColors.primary,
    fontFamily: AppStrings.fontFamily,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: AppColors.primary,
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
        shadowColor: AppColors.light,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w500, color: Colors.white, fontSize: 20)),
    //button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: Colors.grey,
      buttonColor: AppColors.primary,
      splashColor: AppColors.light,
    ),
//elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12))),
    ),
    //Text theme
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: AppColors.primary,
      ),
      displayLarge: const TextStyle(
        color: Colors.black26,
      ),
      displayMedium: const TextStyle(
        color: Colors.black26,
      ),
      // titleMedium: TextStyle(color: AppColors.light, fontSize: 16),
      bodySmall: const TextStyle(
        color: Color.fromARGB(255, 209, 209, 209),
      ),
      bodyLarge: const TextStyle(
        color: Color.fromARGB(255, 209, 209, 209),
      ),
      bodyMedium:
          TextStyle(color: AppColors.light, fontWeight: FontWeight.bold),
    ),
    //input decoration theme (textFormField)
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.orange,
      hoverColor: AppColors.orange,
      prefixIconColor: AppColors.orange,
      suffixIconColor: AppColors.orange,
      fillColor: AppColors.transparent,
      filled: true,
      //content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
//hint style
      hintStyle: TextStyle(
        color: AppColors.light,
      ),
// lable
      labelStyle: const TextStyle(
        color: Color.fromARGB(218, 255, 255, 255),
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
        color: AppColors.orange,
        width: 1.5,
      )),
//error border style
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
//focus error border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
    ),
  );
}
