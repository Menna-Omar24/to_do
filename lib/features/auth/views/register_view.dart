import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helper/navigator.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_padding.dart';
import '../../../core/utils/app_route.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/helper/validator.dart';
import '../../../core/widget/custom_elevated_button.dart';
import '../../../core/widget/custom_svg_wrapper.dart';
import '../../../core/widget/custom_text_form_field.dart';
import '../../../core/widget/default_flag.dart';
import '../../../core/widget/image_manager/image_manager_view.dart';
import '../../home/view/home_view.dart';
import '../cubit/register/register_cubit.dart';
import '../cubit/register/register_state.dart';
import '../../auth/views/widget/custom_row.dart';

class RegisterView extends StatelessWidget {
  static String id = AppRoute.register;

  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: SingleChildScrollView(
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listenWhen: (previous, current) =>
                current is RegisterSuccessState ||
                current is RegisterErrorState,
            listener: (context, state) {
              if (state is RegisterSuccessState) {
                Navigation.goTo(
                  context,
                  HomeView(),
                  type: NavigationType.pushAndRemoveUntil,
                );
              } else if (state is RegisterErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.red,
                    content: Text(
                      state.errorMessage,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
            },
            buildWhen: (previous, current) =>
                current is RegisterLoadingState ||
                previous is RegisterLoadingState ||
                previous is ChangePasswordVisibility ||
                previous is ChangeConfirmPasswordVisibility,
            builder: (context, state) {
              var cubit = RegisterCubit.get(context);
              return Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    ImageManagerView(
                      onImagePicked: (image) => cubit.image = image,
                      imageBuilder: (image) {
                        return DefaultFlag(image: FileImage(File(image.path)));
                      },
                      defaultBuilder: DefaultFlag(),
                    ),
                    SizedBox(height: AppSize.h23),
                    Padding(
                      padding: AppPadding.defaultPadding,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            validator: AppValidator.validateEmail,
                            controller: cubit.userName,
                            prefixIcon: IconButton(
                              onPressed: null,
                              icon: CustomSvgWrapper(path: AppAssets.profileOutline),
                            ),
                            hintText: AppString.hintTextUsername,
                          ),
                          SizedBox(height: AppSize.h10),
                          CustomTextFormField(
                            validator: AppValidator.validateEmail,
                            controller: cubit.email,
                            prefixIcon: IconButton(
                              onPressed: null,
                              icon: CustomSvgWrapper(path: AppAssets.email),
                            ),
                            hintText: AppString.hintTextEmail,
                          ),
                          SizedBox(height: AppSize.h10),
                          CustomTextFormField(
                            validator: AppValidator.validatePassword,
                            controller: cubit.password,
                            prefixIcon: IconButton(
                              onPressed: null,
                              icon: CustomSvgWrapper(path: AppAssets.password),
                            ),
                            suffixIcon: IconButton(
                              onPressed: cubit.changePasswordVisibility,
                              icon: CustomSvgWrapper(
                                path: cubit.passwordSecure
                                    ? AppAssets.unLock
                                    : AppAssets.lock,
                              ),
                            ),
                            obscureText: cubit.passwordSecure,
                            hintText: AppString.hintTextPassword,
                          ),
                          SizedBox(height: AppSize.h10),
                          CustomTextFormField(
                            validator: (String? value) {
                              return AppValidator.validateConfirmPassword(
                                value,
                                cubit.password.text,
                              );
                            },
                            controller: cubit.confirmPassword,
                            prefixIcon: IconButton(
                              onPressed: null,
                              icon: CustomSvgWrapper(path: AppAssets.password),
                            ),
                            suffixIcon: IconButton(
                              onPressed: cubit.changeConfirmPasswordVisibility,
                              icon: CustomSvgWrapper(
                                path: cubit.confirmPasswordSecure
                                    ? AppAssets.unLock
                                    : AppAssets.lock,
                              ),
                            ),
                            obscureText: cubit.confirmPasswordSecure,
                            hintText: AppString.hintTextConfirmPassword,
                          ),
                          SizedBox(height: AppSize.h23),
                          state is RegisterLoadingState
                              ? Center(child: CircularProgressIndicator())
                              : CustomElevatedButton(
                                  text: AppString.elevateRegister,
                                  onPressed: cubit.onRegisterPressed,
                                ),
                          SizedBox(height: AppSize.h40_99),
                          CustomRow(
                            text: AppString.alreadyHaveAnAccount,
                            textButton: AppString.elevateLogin,
                            onPressed: () => Navigation.goBack(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
