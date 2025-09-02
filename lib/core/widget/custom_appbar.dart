import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core/helper/navigator.dart';
import 'package:to_do/features/auth/views/login_view.dart';
import '../theme/app_colors.dart';
import '../utils/app_assets.dart';
import '../utils/app_size.dart';
import '../utils/app_string.dart';
import '../utils/app_text_style.dart';

class CustomAppbar extends StatefulWidget {
  final String userName;
  final void Function()? onTap;

  const CustomAppbar({super.key, required this.userName, this.onTap});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  File? pickImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: widget.onTap,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: pickImage == null
                ? AssetImage(AppAssets.flag)
                : FileImage(pickImage!) as ImageProvider,
          ),
        ),
        SizedBox(width: AppSize.w16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppString.hello,
                  style: AppTextStyle.fW300FS12CBlackLight),
              SizedBox(height: AppSize.h4),
              Text(widget.userName,
                  style: AppTextStyle.fW300FS16CBlackLight),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.logout,),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigation.goTo(
                context, LoginView(), type: NavigationType.pushReplacement);
          },
        ),
      ],
    );
  }
}
