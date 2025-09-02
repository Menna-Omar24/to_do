import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/utils/app_string.dart';
import 'package:to_do/core/widget/custom_svg_wrapper.dart';
import 'package:to_do/features/home/widget/custom_task_card.dart';
import 'package:to_do/features/home/widget/custom_row_text.dart';
import 'package:to_do/features/today_task/view/add_task.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/app_route.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widget/custom_appbar.dart';
import '../../../core/widget/custom_floating_button.dart';
import '../../profile/view/profile_view.dart';
import '../task/home_task.dart';
import '../task/personal_task.dart';
import '../task/work_task.dart';
import '../widget/custom_task.dart';
import '../widget/custom_task_group.dart';

class HomeView extends StatefulWidget {
  static String id = AppRoute.home;

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Map<String, Map<String, dynamic>> groupStyles = {
    "Personal": {
      "icon": AppAssets.profilePrimaryLight,
      "iconColor": AppColors.primary,
      "bgColor": AppColors.primaryLight,
      "titleColor": AppColors.grey,
      "subtitleColor": AppColors.blackLight,
    },
    "Home": {
      "icon": AppAssets.bagBabyBink,
      "iconColor": AppColors.bink,
      "bgColor": AppColors.babyBink,
      "titleColor": AppColors.grey,
      "subtitleColor": AppColors.blackLight,
    },
    "Work": {
      "icon": AppAssets.bagX,
      "iconColor": AppColors.primary,
      "bgColor": AppColors.greyDark,
      "titleColor": AppColors.white,
      "subtitleColor": AppColors.white,
    },
  };

  @override
  Widget build(BuildContext context) {
    final userName =
        ModalRoute.of(context)!.settings.arguments as String? ?? 'Menna Omar';
    return Scaffold(
      floatingActionButton: CustomFloatingButton(
        onPressed: () {
          Navigator.pushNamed(context, AddTask.id);
        },
        icon: AppAssets.plus,
      ),
      body: Padding(
        padding: REdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              CustomAppbar(
                userName: userName,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ProfileView.id,
                    arguments: userName,
                  );
                },
              ),
              SizedBox(height: 20.h),
              Expanded(child: _buildTasksContent()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTasksContent() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("tasks")
          .orderBy("createdAt", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data!.docs;

        if (docs.isEmpty) {
          return _noTasksWidget();
        }

        final totalTasks = docs.length;
        final doneTasks = docs.where((doc) {
          final task = doc.data() as Map<String, dynamic>;
          return task['isDone'] == true;
        }).length;

        return ListView(
          children: [
            CustomTask(totalTasks: totalTasks, doneTasks: doneTasks),
            CustomRowText(title: AppString.inProgress, num: docs.length),
            SizedBox(
              height: AppSize.h105,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final task = docs[index].data() as Map<String, dynamic>;
                  return _buildTaskCard(task);
                },
                separatorBuilder: (context, index) =>
                    SizedBox(width: AppSize.w11),
                itemCount: docs.length,
              ),
            ),

            /// Task Groups Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 26),
              child: Text(
                AppString.taskGroups,
                style: AppTextStyle.fW300FS14CBlackLight,
              ),
            ),

            _taskGroupStream(
              groupName: "Personal",
              title: AppString.personalTask,
              icon: AppAssets.profilePrimary,
              iconColor: AppColors.primaryLight,
              color: AppColors.primaryLight,
              textColor: AppColors.primary,
              route: PersonalTask.id,
            ),
            SizedBox(height: AppSize.h17),
            _taskGroupStream(
              groupName: "Home",
              title: AppString.homeTask,
              icon: AppAssets.home,
              iconColor: AppColors.babyBink,
              color: AppColors.babyBink,
              textColor: AppColors.bink,
              route: HomeTask.id,
            ),
            SizedBox(height: AppSize.h17),
            _taskGroupStream(
              groupName: "Work",
              title: AppString.workTask,
              icon: AppAssets.bag_2x,
              iconColor: AppColors.blackDark,
              color: AppColors.blackDark,
              textColor: AppColors.white,
              route: WorkTask.id,
            ),
          ],
        );
      },
    );
  }

  Widget _taskGroupStream({
    required String groupName,
    required String title,
    required String icon,
    required Color iconColor,
    required Color color,
    required Color textColor,
    required String route,
  }) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("tasks")
          .where("group", isEqualTo: groupName)
          .snapshots(),
      builder: (context, snapshot) {
        final count = snapshot.hasData ? snapshot.data!.docs.length : 0;
        return CustomTaskGroup(
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          title: title,
          icon: icon,
          iconColor: iconColor,
          num: count,
          color: color,
          textColor: textColor,
        );
      },
    );
  }

  Widget _noTasksWidget() {
    return Center(
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            AppString.desHome,
            style: AppTextStyle.fW300FS16CBlackLight,
          ),
          SizedBox(height: AppSize.h31),
          CustomSvgWrapper(path: AppAssets.noData),
        ],
      ),
    );
  }

  Widget _buildTaskCard(Map<String, dynamic> task) {
    String group = task["group"] ?? "";

    final style =
        groupStyles[group] ??
        {
          "icon": AppAssets.bagX,
          "iconColor": AppColors.primary,
          "bgColor": AppColors.greyDark,
          "titleColor": AppColors.white,
          "subtitleColor": AppColors.white,
        };

    return CustomTaskCard(
      title: task["group"] ?? "",
      subtitle: task["title"] ?? "",
      icon: style["icon"] as String,
      iconColor: style["iconColor"] as Color,
      color: style["bgColor"] as Color,
      colorTitle: style["titleColor"] as Color,
      colorSubtitle: style["subtitleColor"] as Color,
    );
  }
}
