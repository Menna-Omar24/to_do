import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/utils/app_size.dart';
import 'package:to_do/features/profile/widget/custom_text_form_field.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/route.dart';
import '../../../core/widget/custom_elevated_button.dart';

class UpdateProfileView extends StatelessWidget {
  static String id = AppRoute.updateProfile;

  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Image.asset(AppAssets.auth),
          SizedBox(height: 23.h),
          CustomTextFormField(
            controller: userNameController,
            hintText: AppString.hintTextUsername,
          ),
          SizedBox(height: AppSize.h23,),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 22),
            child: CustomElevatedButton(titleElevatedButton: AppString.elevateSave),
          ),
        ],
      ),
    );
  }
}
