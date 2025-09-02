// dialog_filter.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/app_colors.dart';
import '../utils/app_assets.dart';
import '../utils/app_size.dart';
import '../utils/app_string.dart';
import '../widget/custom_elevated_button.dart';

class DialogFilter extends StatefulWidget {
  final String initialCategory;
  final String initialStatus;
  final DateTime? initialDate;

  const DialogFilter({
    super.key,
    required this.initialCategory,
    required this.initialStatus,
    this.initialDate,
  });

  @override
  State<DialogFilter> createState() => _DialogFilterState();
}

class _DialogFilterState extends State<DialogFilter> {
  late String selectedCategory;
  late String selectedStatus;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialCategory;
    selectedStatus = widget.initialStatus;
    selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),

          // Category Chips
          Wrap(
            spacing: 10,
            children: [
              buildChip("All", selectedCategory, (v) => selectedCategory = v),
              buildChip("Work", selectedCategory, (v) => selectedCategory = v),
              buildChip("Home", selectedCategory, (v) => selectedCategory = v),
              buildChip("Personal", selectedCategory, (v) => selectedCategory = v),
            ],
          ),

          const SizedBox(height: 20),

          // Status Chips
          Wrap(
            spacing: 10,
            children: [
              buildChip("All", selectedStatus, (v) => selectedStatus = v),
              buildChip("In Progress", selectedStatus, (v) => selectedStatus = v),
              buildChip("Missed", selectedStatus, (v) => selectedStatus = v),
              buildChip("Done", selectedStatus, (v) => selectedStatus = v),
            ],
          ),

          SizedBox(height: AppSize.h22),

          // Date Picker
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

          // Filter Button
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              text: AppString.filter,
              onPressed: () {
                Navigator.pop(context, {
                  "category": selectedCategory,
                  "status": selectedStatus,
                  "date": selectedDate,
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChip(String label, String selectedValue, ValueChanged<String> onSelected) {
    final isSelected = selectedValue == label;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => setState(() => onSelected(label)),
      selectedColor: AppColors.primary,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
        side: BorderSide(color: isSelected ? Colors.transparent : Colors.black, width: 0.5),
      ),
      checkmarkColor: AppColors.white,
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
    );
  }

  String _monthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return months[month - 1];
  }
}
