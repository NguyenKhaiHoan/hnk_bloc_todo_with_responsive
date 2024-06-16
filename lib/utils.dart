import 'package:flutter/material.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/constants/app_style.dart';

class HUtils {
  static SnackBar notificationBottom(String message, bool isError) {
    return SnackBar(
        content: Text(
          message,
          style: HAppStyle.paragraph3Regular
              .copyWith(color: HAppColor.hWhiteColor),
        ),
        backgroundColor:
            isError ? HAppColor.hRedColor : HAppColor.hSelectedSectionColor);
  }
}
