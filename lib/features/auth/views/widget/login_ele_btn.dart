import 'package:flutter/material.dart';
import 'package:to_do/features/auth/views/widget/login_form_fields.dart';
import '../../../../core/helper/navigator.dart';
import '../../../../core/helper/sign_in_account.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../home/view/home_view.dart';
import '../../cubit/login/login_cubit.dart';

class LoginEleBtn extends StatelessWidget {
  const LoginEleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      text: AppString.elevateLogin,
      onPressed: () async {
        if (LoginFormFields.formKey.currentState!.validate()) {
          bool isSignedIn = await signInAccount(
            LoginCubit.get(context).email.text,
            LoginCubit.get(context).password.text,
          );
          if (isSignedIn) {
            Navigation.goTo(
              context,
              HomeView(),
              type: NavigationType.pushAndRemoveUntil,
              // arguments: LoginCubit.get(context).userName.text,
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
                content: Text('Login failed. Please check your credentials.'),
              ),
            );
          }
        }
      },
    );
  }
}
