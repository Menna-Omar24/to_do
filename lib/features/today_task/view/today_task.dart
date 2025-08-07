import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/function/show_dialog.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/utils/app_assets.dart';
import 'package:to_do/features/home/view/home_view.dart';
import 'package:to_do/features/home/widget/custom_row_text.dart';
import 'package:to_do/features/profile/widget/custom_text_form_field.dart';
import '../../../core/utils/app_string.dart';
import '../../../core/utils/route.dart';
import '../../../core/widget/custom_floating_button.dart';
import '../../../core/widget/default_app_bar.dart';
import '../widget/custom_card.dart';

class TodayTask extends StatelessWidget {
  static String id = AppRoute.todayTask;

  const TodayTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingButton(
        onPressed: () {
          showDilog(context);
        },
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
              CustomTextFormField(
                hintText: AppString.search,
                suffixIcon: AppAssets.search,
              ),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  children: [
                    CustomRowText(title: AppString.result, num: 4),
                    CustomCard(
                      title: AppString.taskProgress,
                      icon: AppAssets.bagX,
                      bgIcon: AppColors.black,
                      bgTextColor: AppColors.primaryLight,
                      textIcon: AppString.inProgress,
                      textColor: AppColors.black,
                    ),
                    CustomCard(
                      title: AppString.taskProgress,
                      icon: AppAssets.bagX,
                      bgIcon: AppColors.black,
                      bgTextColor: AppColors.primary,
                      textIcon: AppString.done,
                      textColor: AppColors.white,
                    ),
                    CustomCard(
                      title: AppString.addFeature,
                      icon: AppAssets.homeBabyBink,
                      bgIcon: AppColors.bink,
                      bgTextColor: AppColors.primary,
                      textIcon: AppString.done,
                      textColor: AppColors.white,
                    ),
                    CustomCard(
                      title: AppString.improveMyEnglishSkills,
                      icon: AppAssets.profilePrimaryLight,
                      bgIcon: AppColors.primary,
                      bgTextColor: Colors.red,
                      textIcon: AppString.missed,
                      textColor: AppColors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
