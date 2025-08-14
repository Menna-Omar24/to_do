import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/dialog_filter.dart';

void showDilog(BuildContext context) {
  showDialog(

    context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: DialogFilter(),
        );
       },
     );
  }
