// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/models/list_menu_item.dart';
import 'package:todo_task_bloc_simple/models/tag_menu_item.dart';
import 'package:todo_task_bloc_simple/models/task_item.dart';
import 'package:todo_task_bloc_simple/models/task_menu_item.dart';

part 'dash_board_state.dart';

class DashBoardCubit extends Cubit<DashBoardState> {
  DashBoardCubit() : super(const DashBoardState()) {
    var newTasks = [
      TaskItem(
          dateTime: DateTime.now(),
          title: "Research content ideas",
          description: "Description",
          duaDate: DateTime.now().add(const Duration(days: 10)),
          listMenuItem: ListMenuItem(
              color: HAppColor.hRedColor, title: 'Personal', taskCount: 2)),
      TaskItem(
          dateTime: DateTime.now().subtract(const Duration(hours: 1)),
          title: "Renew driver's license",
          description: "Description",
          duaDate: DateTime.now()
              .subtract(const Duration(hours: 1))
              .add(const Duration(days: 10)),
          listMenuItem: ListMenuItem(
              color: HAppColor.hRedColor, title: 'Personal', taskCount: 2)),
    ];

    var tasksMenu = [
      TaskMenuItem(
          icon: const Icon(Icons.double_arrow),
          title: 'Upcoming',
          taskCount: 12),
      TaskMenuItem(
          icon: const Icon(Icons.menu_open), title: 'Today', taskCount: 2),
      TaskMenuItem(icon: const Icon(Icons.calendar_month), title: 'Calendar'),
      TaskMenuItem(icon: const Icon(Icons.wallet), title: 'Sticky Wall'),
    ];

    var listsMenu = [
      ListMenuItem(color: HAppColor.hRedColor, title: 'Personal', taskCount: 2),
      ListMenuItem(color: HAppColor.hBlueColor, title: 'Work'),
    ];
    var tagsMenu = [
      TagMenuItem(color: HAppColor.hSecondaryBlueColor, title: 'Tag 1'),
      TagMenuItem(color: HAppColor.hSecondaryRedColor, title: 'Tag 2'),
    ];

    emit(state.copyWith(
        tasks: newTasks,
        tasksMenu: tasksMenu,
        listsMenu: listsMenu,
        tagsMenu: tagsMenu));
  }

  void addTask(String title, String description, ListMenuItem listMenuItem,
      DateTime duaDate) {
    var newTasks = [
      TaskItem(
          dateTime: DateTime.now(),
          title: title,
          description: description,
          duaDate: duaDate,
          listMenuItem: listMenuItem),
      ...state.tasks,
    ];

    var tasksMenu = state.tasksMenu;
    var tmpItem = tasksMenu[1];
    var taskCount = tmpItem.taskCount;
    tasksMenu[1] = tmpItem.copyWith(taskCount: taskCount + 1);

    var listsMenu = state.listsMenu;
    final listItemIndex =
        listsMenu.indexWhere((item) => item.title == listMenuItem.title);
    if (listItemIndex != -1) {
      var tmpItem = listsMenu[listItemIndex];
      var taskCount = tmpItem.taskCount;
      listsMenu[listItemIndex] = tmpItem.copyWith(taskCount: taskCount + 1);
    }

    emit(state.copyWith(
        tasks: newTasks, tasksMenu: tasksMenu, listsMenu: listsMenu));
  }

  void removeTask(int index) {
    var newTasks = [...state.tasks];
    var task = newTasks.removeAt(index);

    var tasksMenu = state.tasksMenu;
    var tmpItem = tasksMenu[1];
    var taskCount = tmpItem.taskCount;
    tasksMenu[1] = tmpItem.copyWith(taskCount: taskCount + 1);

    var listsMenu = state.listsMenu;
    final listItemIndex =
        listsMenu.indexWhere((item) => item.title == task.listMenuItem.title);
    if (listItemIndex != -1) {
      var tmpItem = listsMenu[listItemIndex];
      var taskCount = tmpItem.taskCount;
      listsMenu[listItemIndex] = tmpItem.copyWith(taskCount: taskCount - 1);
    }

    emit(state.copyWith(
        tasks: newTasks, tasksMenu: tasksMenu, listsMenu: listsMenu));
  }

  void editTask(int index, String title, String description,
      ListMenuItem listMenuItem, DateTime duaDate) {
    var newTasks = [...state.tasks];
    newTasks[index] = newTasks[index]
        .copyWith(title: title, description: description, duaDate: duaDate);
    emit(state.copyWith(tasks: newTasks));
  }

  void setPageCount(int pageCount) {
    emit(state.copyWith(pageCount: pageCount));
  }

  void setSelectedIdx(int selectedIdx) {
    emit(state.copyWith(selectedIdx: selectedIdx));
  }
}
