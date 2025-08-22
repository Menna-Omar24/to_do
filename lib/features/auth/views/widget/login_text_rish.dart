import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/navigator.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/app_text_style.dart';
import '../register_view.dart';


class LoginTextRish extends StatelessWidget {
  const LoginTextRish({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: AppString.doNotHaveAnAccount,
        style: AppTextStyle.fW200FS14CBlackLight,
        children: [
          TextSpan(
            text: AppString.elevateRegister,
            style: AppTextStyle.fW400FS14CBlackLight,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigation.goTo(context, RegisterView(),);
              },
          ),
        ],
      ),
    );
  }
}
