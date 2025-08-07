import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/utils/app_string.dart';
import 'package:to_do/features/home/widget/custom_task_card.dart';
import 'package:to_do/features/home/widget/custom_row_text.dart';
import 'package:to_do/features/today_task/view/add_task.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_style.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/route.dart';
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
  bool hasData = true;
  List<Widget> modelCard = [
    CustomTaskCard(
      title: AppString.workTask,
      subtitle: AppString.addNewFeatures,
      icon: AppAssets.bagX,
      iconColor: AppColors.primary,
      color: AppColors.greyDark,
      colorTitle: AppColors.white,
      colorSubtitle: AppColors.white,
    ),
    CustomTaskCard(
      title: AppString.personalTask,
      subtitle: AppString.improveMyEnglishSkills,
      icon: AppAssets.profilePrimaryLight,
      iconColor: AppColors.primary,
      color: AppColors.primaryLight,
      colorTitle: AppColors.grey,
      colorSubtitle: AppColors.blackLight,
    ),
    CustomTaskCard(
      title: AppString.workTask,
      subtitle: AppString.addFeature,
      icon: AppAssets.bagX,
      iconColor: AppColors.bink,
      color: AppColors.babyBink,
      colorTitle: AppColors.grey,
      colorSubtitle: AppColors.blackLight,
    ),
  ];

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
          child: hasData
              ? _buildDataContent(userName)
              : _buildEmptyContent(userName),
        ),
      ),
    );
  }

  Widget _buildEmptyContent(String userName) {
    return Column(
      children: [
        CustomAppbar(
          userName: userName,
          onTap: () {
            Navigator.pushNamed(context, ProfileView.id, arguments: userName);
          },
        ),
        SizedBox(height: AppSize.h48),
        Text(
          AppString.desHome,
          style: AppStyle.fW300FS16CBlackLight,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSize.h63_8),
        SvgPicture.asset(AppAssets.noData),
      ],
    );
  }

  Widget _buildDataContent(String userName) {
    return ListView(
      children: [
        Column(
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
            CustomTask(),
            CustomRowText(
              title: AppString.inProgress,
              num: 5,
            ),
            SizedBox(
              height: AppSize.h105,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => modelCard[index],
                separatorBuilder: (context, index) =>
                    SizedBox(width: AppSize.w11),
                itemCount: modelCard.length,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 26),
              child: Row(
                children: [
                  Text(
                    AppString.taskGroups,
                    style: AppStyle.fW300FS14CBlackLight,
                  ),
                ],
              ),
            ),
            CustomTaskGroup(
              onTap: (){
                Navigator.pushNamed(context, PersonalTask.id);
              },
              title: AppString.personalTask,
              icon: AppAssets.profilePrimary,
              iconColor: AppColors.primaryLight,
              num: 5,
              color: AppColors.primaryLight,
              textColor: AppColors.primary,
            ),
            SizedBox(height: AppSize.h17),
            CustomTaskGroup(
              onTap: (){
                Navigator.pushNamed(context, HomeTask.id);
              },
              title: AppString.homeTask,
              icon: AppAssets.home,
              iconColor: AppColors.babyBink,
              num: 3,
              color: AppColors.babyBink,
              textColor: AppColors.bink,
            ),
            SizedBox(height: AppSize.h17),
            CustomTaskGroup(
              onTap: (){
                Navigator.pushNamed(context, WorkTask.id);
              },
              title: AppString.workTask,
              icon: AppAssets.bag_2x,
              iconColor: AppColors.blackDark,
              num: 1,
              color: AppColors.blackDark,
              textColor: AppColors.white,
            ),
          ],
        ),
      ],
    );
  }
}
