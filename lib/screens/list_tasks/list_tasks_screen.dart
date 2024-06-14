import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/constants/app_sizes.dart';
import 'package:todo_task_bloc_simple/constants/app_style.dart';
import 'package:todo_task_bloc_simple/screens/dash_board/dash_board_cubit.dart';
import 'package:todo_task_bloc_simple/screens/edit_task/edit_task_screen.dart';

class ListTasksScreen extends StatelessWidget {
  const ListTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
          top: hAppDefaultPadding / 2, bottom: hAppDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Today',
            style: HAppStyle.heading2Style,
          ),
          gapH40,
          AddTaskSection(),
          const ListTaskSections()
        ],
      ),
    );
  }
}

class ListTaskSections extends StatelessWidget {
  const ListTaskSections({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardCubit, DashBoardState>(
      builder: (context, state) {
        var cubit = context.read<DashBoardCubit>();
        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var item = state.tasks[index];
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
                leading: Checkbox(
                  value: false,
                  onChanged: (bool? value) {},
                ),
                title: Text(
                  item.title,
                  style: HAppStyle.paragraph2Regular,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  cubit.setSelectedIdx(index);
                },
              ),
            );
          },
          itemCount: state.tasks.length,
        );
      },
    );
  }
}

class AddTaskSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardCubit, DashBoardState>(
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
                  'cubit': context.read<DashBoardCubit>(),
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
