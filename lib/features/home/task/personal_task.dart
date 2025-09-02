import 'package:flutter/material.dart';
import 'package:to_do/features/home/task/widget/task_list_view.dart';
import '../../../core/utils/app_route.dart';

class PersonalTask extends StatelessWidget {
  static String id = AppRoute.personalTask;

  const PersonalTask({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskListScreen(
      groupName: "Personal",
      title: "Personal",
    );
  }
}
