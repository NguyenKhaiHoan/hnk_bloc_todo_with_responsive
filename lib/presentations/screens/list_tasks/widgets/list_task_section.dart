import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_bloc_simple/blocs/todo/todo_cubit.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/constants/app_style.dart';

class ListTaskSections extends StatelessWidget {
  const ListTaskSections({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        var cubit = context.read<TodoCubit>();
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
