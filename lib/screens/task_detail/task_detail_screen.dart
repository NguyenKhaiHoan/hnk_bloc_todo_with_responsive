import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_bloc_simple/constants/app_sizes.dart';
import 'package:todo_task_bloc_simple/screens/dash_board/dash_board_cubit.dart';
import 'package:todo_task_bloc_simple/screens/edit_task/edit_task_screen.dart';

class TaskDetailScreen extends StatelessWidget {
  static const String route = "TaskDetailScreen";

  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardCubit, DashBoardState>(
      builder: (context, state) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(state.tasks[state.selectedIdx].dateTime.toIso8601String()),
          gapH10,
          Text(state.tasks[state.selectedIdx].title),
          gapH10,
          Text(state.tasks[state.selectedIdx].description),
          gapH10,
          ElevatedButton(
              onPressed: () {
                if (state.pageCount < 3) {
                  var cubit = context.read<DashBoardCubit>();
                  Navigator.of(context).pushNamed(EditTaskScreen.route,
                      arguments: {"cubit": cubit});
                }
              },
              child: const Text("Edit"))
        ]);
      },
    );
  }
}
