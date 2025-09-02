import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/utils/app_assets.dart';

class DefaultFlag extends StatelessWidget {
  final ImageProvider image;

  const DefaultFlag({super.key, this.image = const AssetImage(AppAssets.flag)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 298.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.r),
          bottomLeft: Radius.circular(20.r),
        ),
        image: DecorationImage(image: image, fit: BoxFit.cover),
      ),
    );
  }
}
