import 'package:flutter/material.dart';

class ListMenuItem {
  final Color color;
  final String title;
  final int taskCount;

  ListMenuItem({required this.color, required this.title, this.taskCount = 0});

  ListMenuItem copyWith({
    Color? color,
    String? title,
    int? taskCount,
  }) {
    return ListMenuItem(
      color: color ?? this.color,
      title: title ?? this.title,
      taskCount: taskCount ?? this.taskCount,
    );
  }
}
