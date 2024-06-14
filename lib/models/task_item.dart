import 'package:equatable/equatable.dart';
import 'package:todo_task_bloc_simple/models/list_menu_item.dart';

class TaskItem extends Equatable {
  final DateTime dateTime;
  final String title;
  final String description;
  final DateTime duaDate;
  final ListMenuItem listMenuItem;

  @override
  List<Object?> get props =>
      [dateTime, title, description, duaDate, listMenuItem];

  const TaskItem(
      {required this.dateTime,
      required this.title,
      required this.description,
      required this.duaDate,
      required this.listMenuItem});

  TaskItem copyWith(
      {DateTime? dateTime,
      String? title,
      String? description,
      DateTime? duaDate,
      ListMenuItem? listMenuItem}) {
    return TaskItem(
      dateTime: dateTime ?? this.dateTime,
      title: title ?? this.title,
      description: description ?? this.description,
      duaDate: duaDate ?? this.duaDate,
      listMenuItem: listMenuItem ?? this.listMenuItem,
    );
  }
}
