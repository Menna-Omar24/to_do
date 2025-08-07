import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/utils/app_assets.dart';
import 'package:to_do/core/widget/custom_elevated_button.dart';
import 'package:to_do/features/profile/widget/custom_text_form_field.dart';

import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/route.dart';
import '../../../core/widget/default_app_bar.dart';
import '../../home/view/home_view.dart';

class AddTask extends StatelessWidget {
  static String id = AppRoute.addTask;

  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: DefaultAppBar(
          title: AppString.addTask,
          onTap: () {
            Navigator.pushNamed(context, HomeView.id);
          },
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.only(top: 30),
              child: Container(
                height: AppSize.h207,
                width: AppSize.w261,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(AppAssets.auth, fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(height: AppSize.h15),
            CustomTextFormField(hintText: AppString.title),
            SizedBox(height: AppSize.h15),
            CustomTextFormField(hintText: AppString.description),
            SizedBox(height: AppSize.h15),
            CustomTextFormField(
              hintText: AppString.group,
              suffixIcon: AppAssets.arrowDown,
            ),
            SizedBox(height: AppSize.h15),
            CustomTextFormField(
                hintText: AppString.endTime),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 22.0, vertical: 20),
              child: CustomElevatedButton(
                titleElevatedButton: AppString.addTask,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
