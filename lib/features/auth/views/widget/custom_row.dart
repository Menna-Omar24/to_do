import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widget/custom_text_button.dart';


class CustomRow extends StatelessWidget {
  final String text;
  final String textButton;
  final void Function()? onPressed;

  const CustomRow({
    super.key,
    required this.text,
    required this.textButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: AppTextStyle.fW200FS14CBlack),
        CustomTextButton(text: textButton, onPressed: onPressed),
      ],
    );
  }
}
