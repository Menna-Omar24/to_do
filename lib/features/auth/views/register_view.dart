import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/utils/app_assets.dart';
import 'package:to_do/core/utils/app_size.dart';
import 'package:to_do/core/widget/custom_elevated_button.dart';
import 'package:to_do/features/auth/cubit/register/register_state.dart';

import '../../../core/helper/create_account.dart';
import '../../../core/helper/navigator.dart';
import '../../../core/helper/validator.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/app_route.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widget/custom_svg_wrapper.dart';
import '../../../core/widget/custom_text_form_field.dart';
import '../../../core/widget/default_flag.dart';
import '../cubit/register/register_cubit.dart';
import 'login_view.dart';

class RegisterView extends StatelessWidget {
  static String id = AppRoute.register;

  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey();

    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: Scaffold(
        body: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) => Form(
            key: key,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DefaultFlag(),
                  SizedBox(height: AppSize.h23),
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 21.0),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: RegisterCubit.get(context).userName,
                          validator: AppValidator.validateUsername,
                          hintText: AppString.hintTextUsername,
                          prefixIcon: IconButton(
                            onPressed: null,
                            icon: CustomSvgWrapper(
                              path: AppAssets.profileOutline,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.h10),
                        CustomTextFormField(
                          controller: RegisterCubit.get(context).email,
                          validator: AppValidator.validateEmail,
                          hintText: AppString.hintTextEmail,
                          prefixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.email_outlined,
                              color: AppColors.blackLight,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.h10),
                        CustomTextFormField(
                          controller: RegisterCubit.get(context).password,
                          validator: AppValidator.validatePassword,
                          hintText: AppString.hintTextPassword,
                          prefixIcon: IconButton(
                            onPressed: null,
                            icon: CustomSvgWrapper(path: AppAssets.password),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              RegisterCubit.get(
                                context,
                              ).changePasswordVisibility();
                            },
                            icon: CustomSvgWrapper(
                              path: RegisterCubit.get(context).isPassword
                                  ? AppAssets.lock
                                  : AppAssets.unLock,
                            ),
                          ),
                          isPassword: RegisterCubit.get(context).isPassword,
                        ),
                        SizedBox(height: AppSize.h10),
                        CustomTextFormField(
                          controller: RegisterCubit.get(
                            context,
                          ).confirmPassword,
                          validator: (value) =>
                              AppValidator.validateConfirmPassword(
                                value,
                                RegisterCubit.get(context).password.text,
                              ),
                          hintText: AppString.hintTextConfirmPassword,
                          prefixIcon: IconButton(
                            onPressed: null,
                            icon: CustomSvgWrapper(path: AppAssets.password),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              RegisterCubit.get(
                                context,
                              ).changeConfirmPasswordVisibility();
                            },
                            icon: CustomSvgWrapper(
                              path: RegisterCubit.get(context).isConfirmPassword
                                  ? AppAssets.lock
                                  : AppAssets.unLock,
                            ),
                          ),
                          isPassword: RegisterCubit.get(
                            context,
                          ).isConfirmPassword,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.h23),
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 21),
                    child: CustomElevatedButton(
                      text: AppString.elevateRegister,
                      onPressed: () async {
                        if (key.currentState!.validate()) {
                          bool isCreated = await createAccount(
                            RegisterCubit.get(context).email.text,
                            RegisterCubit.get(context).password.text,
                          );

                          ScaffoldMessenger.of(context).hideCurrentSnackBar();

                          if (isCreated) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Registration Successful.'),
                              ),
                            );
                            Navigation.goTo(
                              context,
                              LoginView(),
                              type: NavigationType.pushReplacement,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Registration Failed. Please try again.',
                                ),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: AppSize.h40_99),
                  Text.rich(
                    TextSpan(
                      text: AppString.alreadyHaveAnAccount,
                      style: AppTextStyle.fW200FS14CBlackLight,
                      children: [
                        TextSpan(
                          text: AppString.elevateLogin,
                          style: AppTextStyle.fW400FS14CBlackLight,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigation.goTo(
                                context,
                                LoginView(),
                                type: NavigationType.push,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
