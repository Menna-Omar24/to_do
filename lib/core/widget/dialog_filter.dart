import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/widget/custom_elevated_button.dart';

import '../theme/app_colors.dart';
import '../utils/app_assets.dart';
import '../utils/app_size.dart';
import '../utils/app_string.dart';

class DialogFilter extends StatefulWidget {
  const DialogFilter({super.key});

  @override
  State<DialogFilter> createState() => _DialogFilterState();
}

class _DialogFilterState extends State<DialogFilter> {
  String selectedCategory = "All";
  String selectedStatus = "All";
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),

          Wrap(
            spacing: 10,
            children: [
              buildChip("All", selectedCategory, (value) {
                setState(() => selectedCategory = value);
              }),
              buildChip("Work", selectedCategory, (value) {
                setState(() => selectedCategory = value);
              }),
              buildChip("Home", selectedCategory, (value) {
                setState(() => selectedCategory = value);
              }),
              buildChip("Personal", selectedCategory, (value) {
                setState(() => selectedCategory = value);
              }),
            ],
          ),

          const SizedBox(height: 20),

          Wrap(
            spacing: 10,
            children: [
              buildChip("All", selectedStatus, (value) {
                setState(() => selectedStatus = value);
              }),
              buildChip("In Progress", selectedStatus, (value) {
                setState(() => selectedStatus = value);
              }),
              buildChip("Missed", selectedStatus, (value) {
                setState(() => selectedStatus = value);
              }),
              buildChip("Done", selectedStatus, (value) {
                setState(() => selectedStatus = value);
              }),
            ],
          ),

          SizedBox(height: AppSize.h22),
          GestureDetector(
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
                    selectedDate != null
                        ? "${selectedDate!.day} ${_monthName(selectedDate!.month)}, ${selectedDate!.year}"
                        : AppString.selectedDate,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              titleElevatedButton: AppString.filter,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChip(
    String label,
    String selectedValue,
    ValueChanged<String> onSelected,
  ) {
    final isSelected = selectedValue == label;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onSelected(label),
      selectedColor: AppColors.primary,
      backgroundColor: AppColors.white,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
        side: BorderSide(
          color: isSelected ? Colors.transparent : Colors.black,
          width: 0.5,
        ),
      ),
      checkmarkColor: AppColors.white,
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
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
