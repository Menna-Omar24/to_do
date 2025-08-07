import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/utils/app_assets.dart';
import 'package:to_do/core/widget/custom_elevated_button.dart';
import 'package:to_do/features/profile/widget/custom_text_form_field.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/route.dart';
import '../../../core/widget/default_app_bar.dart';
import '../../home/view/home_view.dart';
import '../data/drop_down_item_model.dart';
import '../widget/custom_text_field_drop_down.dart';

class AddTask extends StatefulWidget {
  static String id = AppRoute.addTask;

  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String? selectedStatus;
  DateTime? selectedDate;

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
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: CustomProfileTextFormFiled(
                hint: AppString.group,
                suffixIcon: AppAssets.arrowDown,
                dropdownItems: [
                  DropdownItemModel(
                    title: AppString.home,
                    icon: Container(
                      width: AppSize.w35,
                      height: AppSize.h35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.babyBink,
                      ),
                      child: SizedBox(
                        width: AppSize.w12,
                        child: SvgPicture.asset(
                          AppAssets.home,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  DropdownItemModel(
                    title: AppString.personal,
                    icon: Container(
                      width: AppSize.w35,
                      height: AppSize.h35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.primary,
                      ),
                      child: SizedBox(
                        width: AppSize.w12,
                        child: SvgPicture.asset(
                          AppAssets.profilePrimaryLight,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  DropdownItemModel(
                    title: AppString.work,
                    icon: Container(
                      width: AppSize.w35,
                      height: AppSize.h35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.black,
                      ),
                      child: SizedBox(
                        width: AppSize.w12,
                        child: SvgPicture.asset(
                          AppAssets.bag_2x,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedStatus = value;
                  });
                },
              ),
            ),
            SizedBox(height: AppSize.h15),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() => selectedDate = pickedDate);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.white, width: 1),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.calendar),
                      const SizedBox(width: 10),
                      Text(
                        selectedDate != null
                            ? "${selectedDate!.day} ${_monthName(selectedDate!.month)}, ${selectedDate!.year}"
                            : AppString.selectedDate,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}
