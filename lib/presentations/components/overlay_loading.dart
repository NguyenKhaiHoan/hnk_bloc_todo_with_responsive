import 'package:flutter/material.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/constants/app_sizes.dart';
import 'package:todo_task_bloc_simple/constants/app_style.dart';

class OverlayLoading extends StatelessWidget {
  const OverlayLoading({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey.withOpacity(0.55),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: HAppColor.hBlackColor,
                ),
                gapH24,
                Text(
                  "Loading ...",
                  style: HAppStyle.paragraph2Regular,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
