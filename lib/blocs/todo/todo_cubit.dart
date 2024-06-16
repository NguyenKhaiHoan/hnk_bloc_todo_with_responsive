import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/models/list_menu_item.dart';
import 'package:todo_task_bloc_simple/models/tag_menu_item.dart';
import 'package:todo_task_bloc_simple/models/task_item.dart';
import 'package:todo_task_bloc_simple/models/task_menu_item.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(const TodoState()) {
    loadData();
  }

  void loadData() {
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
      DateTime dueDate) {
    var newTask = TaskItem(
      dateTime: DateTime.now(),
      title: title,
      description: description,
      listMenuItem: listMenuItem,
      duaDate: dueDate,
    );

    state.tasksMenu[1] = state.tasksMenu[1]
        .copyWith(taskCount: state.tasksMenu[1].taskCount + 1);

    final listItemIndex =
        state.listsMenu.indexWhere((item) => item.title == listMenuItem.title);
    if (listItemIndex != -1) {
      state.listsMenu[listItemIndex] = state.listsMenu[listItemIndex]
          .copyWith(taskCount: state.listsMenu[listItemIndex].taskCount + 1);
    }

    emit(state.copyWith(
      tasks: [newTask, ...state.tasks],
      tasksMenu: state.tasksMenu,
      listsMenu: state.listsMenu,
    ));
  }

  void removeTask(int index) {
    var newTasks = [...state.tasks];
    var task = newTasks.removeAt(index);

    state.tasksMenu[1] = state.tasksMenu[1]
        .copyWith(taskCount: state.tasksMenu[1].taskCount - 1);

    final listItemIndex = state.listsMenu
        .indexWhere((item) => item.title == task.listMenuItem.title);
    if (listItemIndex != -1) {
      state.listsMenu[listItemIndex] = state.listsMenu[listItemIndex]
          .copyWith(taskCount: state.listsMenu[listItemIndex].taskCount - 1);
    }

    var currentIndex = newTasks.isNotEmpty
        ? (index < newTasks.length ? index : newTasks.length - 1)
        : -1;

    emit(state.copyWith(
        tasks: newTasks,
        tasksMenu: state.tasksMenu,
        listsMenu: state.listsMenu,
        selectedIdx: currentIndex));
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
