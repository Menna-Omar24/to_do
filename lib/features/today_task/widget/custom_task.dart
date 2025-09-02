import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/app_text_style.dart';
import '../../today_task/view/today_task.dart';

class CustomTask extends StatelessWidget {
  const CustomTask({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("tasks").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final tasks = snapshot.data!.docs;
        int totalTasks = tasks.length;
        int completedTasks = tasks.where((t) {
          final data = t.data() as Map<String, dynamic>;
          return data["isDone"] == true;
        }).length;

        double progress = totalTasks == 0
            ? 0
            : (completedTasks / totalTasks) * 100;

        return Container(
          width: double.infinity,
          height: AppSize.h135,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 22, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.desYourTodayTasks,
                  style: AppTextStyle.fW400FS14CWhite,
                ),
                SizedBox(height: AppSize.h4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: '${progress.toStringAsFixed(0)}',
                        style: AppTextStyle.fW500FS40CWhite,
                        children: [
                          TextSpan(
                              text: '%',
                              style: AppTextStyle.fW500FS24CWhite),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, TodayTask.id);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        AppString.viewTasks,
                        style: AppTextStyle.fW400FS15CPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
