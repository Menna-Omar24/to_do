// today_task.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/widget/custom_floating_button.dart';
import '../../../core/widget/dialog_filter.dart';
import '../../home/view/home_view.dart';
import '../../home/widget/custom_row_text.dart';
import '../widget/custom_card.dart';
import '../../../core/widget/default_app_bar.dart';
import '../../profile/widget/custom_text_form_field.dart';
import '../../../core/utils/app_route.dart';

class TodayTask extends StatefulWidget {
  static String id = AppRoute.todayTask;

  const TodayTask({super.key});

  @override
  State<TodayTask> createState() => _TodayTaskState();
}

class _TodayTaskState extends State<TodayTask> {
  List<Map<String, dynamic>> allTasks = [];
  List<Map<String, dynamic>> filteredTasks = [];
  String searchQuery = "";
  String selectedCategory = "All";
  String selectedStatus = "All";
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    final snapshot = await FirebaseFirestore.instance.collection("tasks").get();
    final tasks = snapshot.docs.map((e) => e.data() as Map<String, dynamic>).toList();
    setState(() {
      allTasks = tasks;
      filteredTasks = tasks;
    });
  }

  void applyFilters() {
    setState(() {
      filteredTasks = allTasks.where((task) {
        final matchesSearch = task["title"].toString().toLowerCase().contains(searchQuery.toLowerCase());

        final matchesCategory = selectedCategory == "All" || task["group"]?.toString() == selectedCategory;

        final taskStatus = getStatus(task);
        final matchesStatus = selectedStatus == "All" || taskStatus == selectedStatus;

        final matchesDate = selectedDate == null ||
            (task["date"] != null &&
                DateTime.tryParse(task["date"])!.year == selectedDate!.year &&
                DateTime.tryParse(task["date"])!.month == selectedDate!.month &&
                DateTime.tryParse(task["date"])!.day == selectedDate!.day);

        return matchesSearch && matchesCategory && matchesStatus && matchesDate;
      }).toList();
    });
  }

  void openFilterDialog() async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => DialogFilter(
        initialCategory: selectedCategory,
        initialStatus: selectedStatus,
        initialDate: selectedDate,
      ),
    );

    if (result != null) {
      setState(() {
        selectedCategory = result["category"];
        selectedStatus = result["status"];
        selectedDate = result["date"];
      });
      applyFilters();
    }
  }

  String getStatus(Map<String, dynamic> task) {
    if (task["isDone"] == true) return "Done";

    if (task["date"] != null) {
      DateTime? taskDate = DateTime.tryParse(task["date"]);
      if (taskDate != null) {
        final now = DateTime.now();
        if (taskDate.isBefore(DateTime(now.year, now.month, now.day))) {
          return "Missed";
        }
      }
    }
    return "In Progress";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingButton(
        onPressed: openFilterDialog,
        icon: AppAssets.filter,
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: DefaultAppBar(
          title: AppString.tasks,
          onTap: () {
            Navigator.pushNamed(context, HomeView.id);
          },
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              CustomTextField(
                hintText: AppString.search,
                suffixIcon: AppAssets.search,
                onChanged: (value) {
                  searchQuery = value;
                  applyFilters();
                },
              ),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  children: [
                    CustomRowText(
                      title: AppString.result,
                      num: filteredTasks.length,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: filteredTasks.length,
                      itemBuilder: (context, index) {
                        final task = filteredTasks[index];
                        final status = getStatus(task);
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoute.editTask,
                              arguments: task,
                            );
                          },
                          child: CustomCard(
                            title: task["title"] ?? "",
                            icon: AppAssets.bagX,
                            bgIcon: AppColors.black,
                            bgTextColor: status == "Done"
                                ? AppColors.primary
                                : status == "Missed"
                                ? Colors.red
                                : AppColors.primaryLight,
                            textIcon: status,
                            textColor: status == "Done" ? AppColors.white : AppColors.black,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
