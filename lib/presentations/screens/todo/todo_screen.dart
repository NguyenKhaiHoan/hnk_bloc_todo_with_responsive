import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_bloc_simple/blocs/todo/todo_cubit.dart';
import 'package:todo_task_bloc_simple/constants/app_sizes.dart';
import 'package:todo_task_bloc_simple/presentations/screens/list_tasks/list_tasks_screen.dart';
import 'package:todo_task_bloc_simple/presentations/screens/todo/components/drawer_list_edit.dart';
import 'package:todo_task_bloc_simple/presentations/screens/todo/components/list_with_detail.dart';

class TodoScreen extends StatelessWidget {
  static const String route = "TodoScreen";

  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
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
    context.read<TodoCubit>().setPageCount(pageCount);
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
