import 'package:flutter/material.dart';
import 'package:todo_task_bloc_simple/constants/app_sizes.dart';
import 'package:todo_task_bloc_simple/constants/app_style.dart';
import 'package:todo_task_bloc_simple/presentations/screens/list_tasks/widgets/add_task_section.dart';
import 'package:todo_task_bloc_simple/presentations/screens/list_tasks/widgets/list_task_section.dart';

class ListTasksScreen extends StatelessWidget {
  const ListTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.only(
          top: hAppDefaultPadding / 2, bottom: hAppDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today',
            style: HAppStyle.heading2Style,
          ),
          gapH40,
          AddTaskSection(),
          ListTaskSections()
        ],
      ),
    );
  }
}
