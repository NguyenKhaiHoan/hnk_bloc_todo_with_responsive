import 'package:flutter/material.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/constants/app_style.dart';

class AddListSection extends StatelessWidget {
  const AddListSection({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Add new list',
          style: HAppStyle.paragraph2Regular,
        ),
        onTap: () {},
      ),
    );
  }
}
