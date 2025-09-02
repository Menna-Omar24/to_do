import 'package:flutter/material.dart';
import 'package:to_do/core/utils/app_route.dart';
import 'package:to_do/features/home/task/widget/task_list_view.dart';

class WorkTask extends StatelessWidget {
  static String id = AppRoute.workTask;

  const WorkTask({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskListScreen(
      groupName: "Work",
      title: "Work",
    );
  }
}
