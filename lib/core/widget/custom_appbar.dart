import 'package:flutter/material.dart';
import '../theme/app_style.dart';
import '../utils/app_assets.dart';
import '../utils/app_size.dart';
import '../utils/app_string.dart';

class CustomAppbar extends StatelessWidget {
  final String userName;
  final void Function()? onTap;

  const CustomAppbar({super.key, required this.userName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(AppAssets.auth),
          ),
        ),
        SizedBox(width: AppSize.w16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppString.hello, style: AppStyle.fW300FS12CBlackLight),
            SizedBox(height: AppSize.h4),
            Text(userName, style: AppStyle.fW300FS16CBlackLight),
          ],
        ),
      ],
    );
  }
}
