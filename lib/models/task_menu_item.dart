import 'package:flutter/material.dart';

class TaskMenuItem {
  final Icon icon;
  final String title;
  final int taskCount;

  TaskMenuItem({required this.icon, required this.title, this.taskCount = 0});

  TaskMenuItem copyWith({
    Icon? icon,
    String? title,
    int? taskCount,
  }) {
    return TaskMenuItem(
      icon: icon ?? this.icon,
      title: title ?? this.title,
      taskCount: taskCount ?? this.taskCount,
    );
  }
}
