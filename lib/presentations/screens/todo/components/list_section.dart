import 'package:flutter/material.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/constants/app_style.dart';
import 'package:todo_task_bloc_simple/models/list_menu_item.dart';

class ListSection extends StatelessWidget {
  const ListSection({super.key, required this.item});

  final ListMenuItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: item.color),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            ' ',
            style: HAppStyle.paragraph4Bold,
          ),
        ),
      ),
      title: Text(item.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: HAppStyle.paragraph2Regular),
      trailing: item.taskCount != 0
          ? DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: HAppColor.hSelectedSectionColor),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  item.taskCount.toString(),
                  style: HAppStyle.heading5Style,
                ),
              ),
            )
          : const SizedBox(),
      onTap: () {},
    );
  }
}
