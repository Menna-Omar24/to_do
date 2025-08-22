import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/validator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widget/custom_svg_wrapper.dart';
import '../../../../core/widget/custom_text_form_field.dart';
import '../../cubit/login/login_cubit.dart';
import '../../cubit/login/login_state.dart';

class LoginFormFields extends StatelessWidget {
  static final formKey = GlobalKey<FormState>();

  const LoginFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: cubit.userName,
            validator: AppValidator.validateUsername,
            hintText: AppString.hintTextUsername,
            prefixIcon: IconButton(
              onPressed: () {},
              icon: CustomSvgWrapper(path: AppAssets.profileOutline),
            ),
          ),
          SizedBox(height: AppSize.h10),
          CustomTextFormField(
            controller: cubit.email,
            validator: AppValidator.validateEmail,
            hintText: AppString.hintTextEmail,
            prefixIcon: IconButton(
              onPressed: null,
              icon: Icon(Icons.email_outlined, color: AppColors.blackLight),
            ),
          ),
          SizedBox(height: AppSize.h10),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomTextFormField(
                controller: cubit.password,
                validator: AppValidator.validatePassword,
                hintText: AppString.hintTextPassword,
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: CustomSvgWrapper(path: AppAssets.password),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    cubit.changePasswordVisibility();
                  },
                  icon: CustomSvgWrapper(
                    path: cubit.passwordSecure
                        ? AppAssets.lock
                        : AppAssets.unLock,
                  ),
                ),
                isPassword: cubit.passwordSecure,
              );
            },
          ),
        ],
      ),
    );
  }
}
