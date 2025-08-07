import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/utils/app_string.dart';
import 'package:to_do/features/home/widget/custom_task_card.dart';
import 'package:to_do/features/home/widget/in_progress.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_style.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_size.dart';
import '../../../core/utils/route.dart';
import '../../../core/widget/custom_appbar.dart';
import '../../profile/view/profile_view.dart';
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
        ModalRoute.of(context)!.settings.arguments as String? ?? 'Guest';
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50),
        ),
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: SvgPicture.asset(AppAssets.plus, width: AppSize.s24),
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
            CustomAppbar(userName: userName),
            SizedBox(height: 20.h),
            CustomTask(),
            InProgress(),
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
              title: AppString.personalTask,
              icon: AppAssets.profilePrimary,
              iconColor: AppColors.primaryLight,
              num: 5,
              color: AppColors.primaryLight,
              textColor: AppColors.primary,
            ),
            SizedBox(height: AppSize.h17),
            CustomTaskGroup(
              title: AppString.homeTask,
              icon: AppAssets.home,
              iconColor: AppColors.babyBink,
              num: 3,
              color: AppColors.babyBink,
              textColor: AppColors.bink,
            ),
            SizedBox(height: AppSize.h17),
            CustomTaskGroup(
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
