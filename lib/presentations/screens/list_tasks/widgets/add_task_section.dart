import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_bloc_simple/blocs/todo/todo_cubit.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/constants/app_style.dart';
import 'package:todo_task_bloc_simple/presentations/screens/edit_task/edit_task_screen.dart';

class AddTaskSection extends StatelessWidget {
  const AddTaskSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: const Border(
              top: BorderSide(
                color: HAppColor.hSecondaryBackgroundColor,
                width: 2.0,
              ),
            ),
          ),
          child: ListTile(
            leading: const Icon(Icons.add),
            title: const Text(
              'Add new task',
              style: HAppStyle.paragraph2Regular,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                EditTaskScreen.route,
                arguments: {
                  'cubit': context.read<TodoCubit>(),
                  'isAddMode': true,
                },
              );
            },
          ),
        );
      },
    );
  }
}
