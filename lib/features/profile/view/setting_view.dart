import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/utils/app_size.dart';
import 'package:to_do/features/profile/view/profile_view.dart';

import '../../../core/utils/app_string.dart';
import '../../../core/utils/app_route.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widget/default_app_bar.dart';
import '../cubit/language_cubit.dart';
import '../cubit/language_state.dart';

class SettingView extends StatelessWidget {
  static String id = AppRoute.settings;

  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LanguageCubit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: DefaultAppBar(
            title: AppString.settings,
            onTap: () {
              Navigator.pushNamed(context, ProfileView.id);
            },
          ),
        ),
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Builder(
            builder: (context) => BlocBuilder<LanguageCubit, LanguageState>(
              builder: (context, state) {
                var cubit = LanguageCubit.get(context);
                return Row(
                  children: [
                    Text(
                      AppString.language,
                      style: AppTextStyle.fW300FS20CBlackLight,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        cubit.changeLanguage('ar');
                      },
                      child: Container(
                        width: AppSize.w51,
                        height: AppSize.h36,
                        decoration: BoxDecoration(
                          color: cubit.lang == 'ar'
                              ? AppColors.primary
                              : AppColors.lightGrey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),

                        child: Center(
                          child: Text(
                            'AR',
                            style: cubit.lang == 'ar'
                                ? AppTextStyle.fW300FS20CWhite
                                : AppTextStyle.fW300FS20CBlackLight,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cubit.changeLanguage('en');
                      },
                      child: Container(
                        width: AppSize.w51,
                        height: AppSize.h36,
                        decoration: BoxDecoration(
                          color: cubit.lang == 'en'
                              ? AppColors.primary
                              : AppColors.lightGrey,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'EN',
                            style: cubit.lang == 'en'
                                ? AppTextStyle.fW300FS20CWhite
                                : AppTextStyle.fW300FS20CBlackLight,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
