import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_bloc_simple/blocs/todo/todo_cubit.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/constants/app_fonts.dart';
import 'package:todo_task_bloc_simple/constants/app_style.dart';
import 'package:todo_task_bloc_simple/models/task_menu_item.dart';

class TaskSection extends StatelessWidget {
  const TaskSection({super.key, required this.isSelected, required this.item});

  final TaskMenuItem item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        var taskMenuItem =
            state.tasksMenu.firstWhere((taskMenuItem) => taskMenuItem == item);
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected
                  ? HAppColor.hSelectedSectionColor
                  : HAppColor.hTransparentColor),
          child: ListTile(
            leading: taskMenuItem.icon,
            title: Text(taskMenuItem.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: isSelected
                    ? const TextStyle(
                        fontStyle: FontStyle.normal,
                        color: HAppColor.hBlackColor,
                        fontFamily: HAppFont.nunitoFontFamily,
                        fontSize: 14,
                        fontWeight: HAppFont.nunitoBold,
                      )
                    : HAppStyle.paragraph2Regular),
            trailing: taskMenuItem.taskCount != 0
                ? DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: !isSelected
                            ? HAppColor.hSelectedSectionColor
                            : HAppColor.hWhiteColor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        item.taskCount.toString(),
                        style: HAppStyle.heading5Style,
                      ),
                    ),
                  )
                : const SizedBox(),
            onTap: () {},
          ),
        );
      },
    );
  }
}
