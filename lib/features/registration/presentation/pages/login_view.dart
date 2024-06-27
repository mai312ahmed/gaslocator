import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaslocator/App/bloc/app_bloc.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.translate,
                  color: AppColors.light,
                ),
                onPressed: () {
                  if (AppLocalizations.of(context)!.isEnLocale) {
                    context.read<AppBloc>().add(ChangeLocalToArabic());
                  } else {
                    context.read<AppBloc>().add(ChangeLocalToEnglish());
                  }
                }),
          ),
          body: LoginViewBody(),
        );
      },
    );
  }
}
