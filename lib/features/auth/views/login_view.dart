import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/core/utils/app_padding.dart';
import 'package:to_do/features/auth/views/widget/login_ele_btn.dart';
import 'package:to_do/features/auth/views/widget/login_form_fields.dart';
import 'package:to_do/features/auth/views/widget/login_text_rish.dart';

import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_route.dart';
import '../../../core/widget/default_flag.dart';
import '../cubit/login/login_cubit.dart';

class LoginView extends StatelessWidget {
  static String id = AppRoute.login;

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  DefaultFlag(),
                  SizedBox(height: AppSize.h23),
                  Padding(
                    padding: AppPadding.defaultPadding,
                    child: Column(
                      children: [
                        LoginFormFields(),
                        SizedBox(height: AppSize.h23),
                        LoginEleBtn(),
                        SizedBox(height: AppSize.h40_99),
                        LoginTextRish(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
