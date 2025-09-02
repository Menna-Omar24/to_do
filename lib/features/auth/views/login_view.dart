import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/core/utils/app_assets.dart';
import 'package:to_do/core/utils/app_padding.dart';
import 'package:to_do/core/utils/app_route.dart';
import 'package:to_do/core/utils/app_size.dart';
import 'package:to_do/core/widget/custom_elevated_button.dart';
import 'package:to_do/core/widget/custom_svg_wrapper.dart';
import 'package:to_do/core/widget/custom_text_form_field.dart';
import 'package:to_do/core/widget/default_flag.dart';
import 'package:to_do/features/auth/views/register_view.dart';
import 'package:to_do/features/auth/views/widget/custom_row.dart';

import '../../../core/helper/navigator.dart';
import '../../../core/utils/app_string.dart';
import '../../home/view/home_view.dart';
import '../cubit/login/login_cubit.dart';
import '../cubit/login/login_state.dart';

class LoginView extends StatelessWidget {
  static String id = AppRoute.login;

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              DefaultFlag(),
              SizedBox(height: AppSize.h23),
              Padding(
                padding: AppPadding.defaultPadding,
                child: Column(
                  children: [
                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginChangePasswordVisibility) {
                          print('object');
                        }
                      },
                      builder: (context, state) {
                        var cubit = LoginCubit.get(context);
                        return Column(
                          children: [
                            CustomTextFormField(
                              controller: cubit.email,
                              prefixIcon: IconButton(
                                onPressed: null,
                                icon: CustomSvgWrapper(
                                  path: AppAssets.email,
                                ),
                              ),
                              hintText: AppString.hintTextEmail,
                            ),
                            SizedBox(height: AppSize.h10),
                            CustomTextFormField(
                              controller: cubit.password,
                              prefixIcon: IconButton(
                                onPressed: null,
                                icon: CustomSvgWrapper(
                                  path: AppAssets.password,
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  cubit.changePasswordVisibility();
                                },
                                icon: CustomSvgWrapper(
                                  path: cubit.passwordSecure
                                      ? AppAssets.unLock
                                      : AppAssets.lock,
                                ),
                              ),
                              obscureText: cubit.passwordSecure,
                              hintText: AppString.hintTextPassword,
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: AppSize.h23),
                    CustomElevatedButton(
                      text: AppString.elevateLogin,
                      onPressed: () => Navigation.goTo(
                        context,
                        HomeView(),
                        type: NavigationType.pushAndRemoveUntil,
                      ),
                    ),
                    SizedBox(height: AppSize.h40_99),
                    CustomRow(
                      text: AppString.doNotHaveAnAccount,
                      textButton: AppString.elevateRegister,
                      onPressed: () => Navigation.goTo(context, RegisterView()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
