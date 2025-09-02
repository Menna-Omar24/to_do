import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/helper/image_function.dart';
import 'package:to_do/core/utils/app_padding.dart';
import 'package:to_do/core/utils/app_size.dart';
import 'package:to_do/features/profile/widget/custom_text_form_field.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/app_route.dart';
import '../../../core/widget/custom_elevated_button.dart';

class UpdateProfileView extends StatefulWidget {
  static String id = AppRoute.updateProfile;

  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  File? pickImage;

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        AppString.choiceImage,
                        textAlign: TextAlign.center,
                      ),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  File? temp =
                                      await ImageFunction.cameraPicker();
                                  if (temp != null) {
                                    setState(() {
                                      pickImage = temp;
                                    });
                                  }
                                },
                                icon: Icon(
                                  Icons.camera_alt,
                                  size: 40.sp,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  File? temp =
                                      await ImageFunction.galleryPicker();
                                  if (temp != null) {
                                    setState(() {
                                      pickImage = temp;
                                    });
                                  }
                                },
                                icon: Icon(
                                  Icons.photo_library,
                                  size: 40.sp,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.grey,
                    radius: 90,
                    backgroundImage: pickImage == null
                        ? AssetImage(AppAssets.flag)
                        : FileImage(pickImage!),
                  ),

                  Positioned(
                    bottom: 10,
                    left: 70,
                    child: Icon(Icons.camera_alt_sharp, size: 30.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 23.h),
            CustomTextField(hintText: AppString.hintTextUsername),
            SizedBox(height: AppSize.h23),
            Padding(
              padding:AppPadding.defaultPadding,
              child: CustomElevatedButton(
                text: AppString.elevateSave,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
