import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/utils/app_assets.dart';
import 'package:to_do/core/widget/custom_elevated_button.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/app_route.dart';
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
  TimeOfDay? selectedTime;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: DefaultAppBar(
          title: AppString.addTask,
          onTap: () {
            Navigator.pushNamed(context, HomeView.id);
          },
        ),
      ),
      body: SingleChildScrollView(
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
                  child: Image.asset(AppAssets.flag, fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(height: AppSize.h15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: AppString.title,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSize.h15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: descController,
                decoration: InputDecoration(
                  hintText: AppString.description,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSize.h15),

            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: CustomProfileTextFormFiled(
                hint: AppString.group,
                suffixIcon: AppAssets.arrowDown,
                dropdownItems: [
                  DropdownItemModel(
                    title: "Home",
                    icon: _buildIcon(AppAssets.home, AppColors.babyBink),
                  ),
                  DropdownItemModel(
                    title: "Personal",
                    icon: _buildIcon(AppAssets.profilePrimaryLight, AppColors.primary),
                  ),
                  DropdownItemModel(
                    title: "Work",
                    icon: _buildIcon(AppAssets.bag_2x, AppColors.black),
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
                    final pickedTime = await showTimePicker(
                      context: context,
                      initialTime: selectedTime ?? TimeOfDay.now(),
                    );

                    if (pickedTime != null) {
                      setState(() {
                        selectedDate = pickedDate;
                        selectedTime = pickedTime;
                      });
                    }
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
                        (selectedDate != null && selectedTime != null)
                            ? "${selectedDate!.day} ${_monthName(selectedDate!.month)}, ${selectedDate!.year} - ${_formatTime(selectedTime!)}"
                            : "Select Date & Time",
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
                text: AppString.addTask,
                onPressed: _addTask,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addTask() async {
    if (titleController.text.isEmpty ||
        descController.text.isEmpty ||
        selectedStatus == null ||
        selectedDate == null ||
        selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(" Please fill all fields")),
      );
      return;
    }

    try {
      final dateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );

      final newTask = {
        "title": titleController.text,
        "description": descController.text,
        "dateTime": dateTime.toIso8601String(),
        "group": selectedStatus!.trim(),
        "createdAt": DateTime.now(),
      };

      await FirebaseFirestore.instance.collection("tasks").add(newTask);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Task added successfully")),
      );

      titleController.clear();
      descController.clear();
      setState(() {
        selectedDate = null;
        selectedTime = null;
        selectedStatus = null;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  Widget _buildIcon(String asset, Color color) {
    return Container(
      width: AppSize.w35,
      height: AppSize.h35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: color,
      ),
      child: SizedBox(
        width: AppSize.w12,
        child: SvgPicture.asset(asset, fit: BoxFit.scaleDown),
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

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? "am" : "pm";
    return "$hour:$minute $period";
  }
}
