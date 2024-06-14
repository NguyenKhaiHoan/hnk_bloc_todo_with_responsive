import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/constants/app_fonts.dart';
import 'package:todo_task_bloc_simple/constants/app_sizes.dart';
import 'package:todo_task_bloc_simple/constants/app_style.dart';
import 'package:todo_task_bloc_simple/models/list_menu_item.dart';
import 'package:todo_task_bloc_simple/models/task_menu_item.dart';
import 'package:todo_task_bloc_simple/screens/dash_board/dash_board_cubit.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardCubit, DashBoardState>(
      builder: (context, state) {
        var tasksMenu = state.tasksMenu;
        var listsMenu = state.listsMenu;
        var tagsMenu = state.tagsMenu;
        return Container(
          padding: hAppDefaultPaddingLTRB,
          height: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HAppColor.hSecondaryBackgroundColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Menu',
                          style: HAppStyle.heading4Style,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: const Icon(Icons.menu),
                        )
                      ],
                    ),
                    gapH10,
                    const Row(
                      children: [
                        Icon(Icons.search),
                        gapW10,
                        Text(
                          'Search',
                          style: HAppStyle.paragraph2Regular,
                        )
                      ],
                    ),
                    gapH24,
                    const Text(
                      'TASKS',
                      style: HAppStyle.heading5Style,
                    ),
                    gapH10,
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: tasksMenu.length,
                        itemBuilder: (context, index) {
                          return TaskSection(
                              isSelected: index == 1 ? true : false,
                              item: tasksMenu[index]);
                        }),
                    gapH24,
                    const Text(
                      'LISTS',
                      style: HAppStyle.heading5Style,
                    ),
                    gapH10,
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: listsMenu.length + 1,
                        itemBuilder: (context, index) {
                          if (index == listsMenu.length) {
                            return AddListSection();
                          }
                          return ListSection(item: listsMenu[index]);
                        }),
                    gapH24,
                    const Text(
                      'TAGS',
                      style: HAppStyle.heading5Style,
                    ),
                    gapH10,
                    Wrap(
                      children: [
                        for (int index = 0;
                            index < tagsMenu.length + 1;
                            index++)
                          index < tagsMenu.length
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      right: 5, bottom: 5),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: tagsMenu[index].color),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: Text(
                                        tagsMenu[index].title,
                                        style: HAppStyle.heading5Style,
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: HAppColor.hGreyColor),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: Text(
                                        '+ Add new tag',
                                        style: HAppStyle.heading5Style,
                                      ),
                                    ),
                                  ),
                                )
                      ],
                    ),
                  ],
                ),
              )),
              Container(
                color: HAppColor.hSecondaryBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTile(
                      leading: Icon(Icons.settings),
                      title: Text(
                        'Settings',
                        style: HAppStyle.paragraph2Regular,
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text(
                        'Sign out',
                        style: HAppStyle.paragraph2Regular,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class TaskSection extends StatelessWidget {
  const TaskSection({super.key, required this.isSelected, required this.item});

  final TaskMenuItem item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardCubit, DashBoardState>(
      builder: (context, state) {
        var taskMenuItem =
            state.tasksMenu.firstWhere((taskMenuItem) => taskMenuItem == item);
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected
                  ? HAppColor.hSelectedSectionColor
                  : HAppColor.hTransparentColor),
          child: ListTile(
            leading: taskMenuItem.icon,
            title: Text(taskMenuItem.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: isSelected
                    ? const TextStyle(
                        fontStyle: FontStyle.normal,
                        color: HAppColor.hBlackColor,
                        fontFamily: HAppFont.nunitoFontFamily,
                        fontSize: 14,
                        fontWeight: HAppFont.nunitoBold,
                      )
                    : HAppStyle.paragraph2Regular),
            trailing: taskMenuItem.taskCount != 0
                ? DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: !isSelected
                            ? HAppColor.hSelectedSectionColor
                            : HAppColor.hWhiteColor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        item.taskCount.toString(),
                        style: HAppStyle.heading5Style,
                      ),
                    ),
                  )
                : const SizedBox(),
            onTap: () {},
          ),
        );
      },
    );
  }
}

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

class AddListSection extends StatelessWidget {
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
