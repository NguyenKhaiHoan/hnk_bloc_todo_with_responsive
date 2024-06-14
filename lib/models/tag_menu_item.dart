import 'package:flutter/material.dart';

class TagMenuItem {
  final Color color;
  final String title;

  TagMenuItem({required this.color, required this.title});

  TagMenuItem copyWith({
    Color? color,
    String? title,
  }) {
    return TagMenuItem(
      color: color ?? this.color,
      title: title ?? this.title,
    );
  }
}
