import 'package:flutter/material.dart';

import '../../../core/utils/app_string.dart';
import '../../../core/utils/route.dart';
import '../../../core/widget/default_app_bar.dart';
import '../view/home_view.dart';

class WorkTask extends StatelessWidget {
  static String id = AppRoute.workTask;
  const WorkTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: DefaultAppBar(
          title: AppString.workTask,
          onTap: () {
            Navigator.pushNamed(context, HomeView.id);
          },
        ),
      ),
    );
  }
}
