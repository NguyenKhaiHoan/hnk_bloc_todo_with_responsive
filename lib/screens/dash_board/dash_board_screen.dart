import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/constants/app_sizes.dart';
import 'package:todo_task_bloc_simple/screens/drawer/drawer_screen.dart';
import 'package:todo_task_bloc_simple/screens/edit_task/edit_task_screen.dart';
import 'package:todo_task_bloc_simple/screens/list_tasks/list_tasks_screen.dart';

import 'dash_board_cubit.dart';

class DashBoardScreen extends StatelessWidget {
  static const String route = "ListTasks";

  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashBoardCubit(),
      child: const Page(),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    int pageCount = 0;
    if (width <= 600) {
      pageCount = 1;
    } else if (width <= 900) {
      pageCount = 2;
    } else {
      pageCount = 3;
    }
    context.read<DashBoardCubit>().setPageCount(pageCount);
    return Scaffold(
      body: Padding(
        padding: hAppDefaultPaddingLTRB,
        child: switch (pageCount) {
          == 1 => const ListTasksScreen(),
          == 2 => const ListTasksWithDrawerPage(),
          == 3 => const ListTasksDrawerEditPage(),
          _ => const ListTasksScreen(),
        },
      ),
    );
  }
}

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
              child: EditTaskScreen(
                oldPageCount: 3,
              ),
            )),
      ],
    );
  }
}
