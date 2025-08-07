import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/theme/app_style.dart';
import '../utils/app_assets.dart';
import '../utils/app_size.dart';

class DefaultAppBar extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const DefaultAppBar({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: AppStyle.fW300FS19CBlackLight,),
      leading: SizedBox(
        width: AppSize.w13_56,
        height: AppSize.h7_44,
        child: InkWell(
          onTap: onTap,
          child: SvgPicture.asset(
            AppAssets.arrowBack,
            width: AppSize.w13_56,
            height: AppSize.h7_44,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
