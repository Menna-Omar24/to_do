import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/dialog_filter.dart';

Future<Map<String, dynamic>?> showDilog(
    BuildContext context, {
      required String category,
      required String status,
      DateTime? date,
    }) async {
  return await showDialog<Map<String, dynamic>>(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: DialogFilter(
          initialCategory: category,
          initialStatus: status,
          initialDate: date,
        ),
      );
    },
  );
}
