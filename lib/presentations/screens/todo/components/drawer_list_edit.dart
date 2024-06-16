import 'package:flutter/material.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/constants/app_sizes.dart';
import 'package:todo_task_bloc_simple/presentations/screens/edit_task/edit_task_screen.dart';
import 'package:todo_task_bloc_simple/presentations/screens/list_tasks/list_tasks_screen.dart';
import 'package:todo_task_bloc_simple/presentations/screens/todo/components/drawer_todo.dart';

class ListTasksDrawerEditPage extends StatelessWidget {
  const ListTasksDrawerEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(flex: 2, child: DrawerScreen()),
        gapW10,
        const Expanded(flex: 3, child: ListTasksScreen()),
        gapW10,
        Expanded(
            flex: 3,
            child: Container(
              padding: hAppDefaultPaddingLTRB,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: HAppColor.hSecondaryBackgroundColor),
              child: const EditTaskScreen(
                oldPageCount: 3,
              ),
            )),
      ],
    );
  }
}
