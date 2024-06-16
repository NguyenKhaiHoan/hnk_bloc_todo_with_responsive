import 'package:flutter/material.dart';
import 'package:todo_task_bloc_simple/constants/app_sizes.dart';
import 'package:todo_task_bloc_simple/presentations/screens/list_tasks/list_tasks_screen.dart';
import 'package:todo_task_bloc_simple/presentations/screens/todo/components/drawer_todo.dart';

class ListTasksWithDrawerPage extends StatelessWidget {
  const ListTasksWithDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: DrawerScreen()),
        gapW10,
        Expanded(flex: 3, child: ListTasksScreen()),
      ],
    );
  }
}
