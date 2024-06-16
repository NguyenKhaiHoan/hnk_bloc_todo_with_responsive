part of 'todo_cubit.dart';

class TodoState extends Equatable {
  final List<TaskItem> tasks;
  final List<TaskMenuItem> tasksMenu;
  final List<ListMenuItem> listsMenu;
  final List<TagMenuItem> tagsMenu;
  final int selectedIdx;
  final int pageCount;

  @override
  List<Object> get props => [tasks, selectedIdx, pageCount];

  const TodoState({
    this.tasks = const [],
    this.tasksMenu = const [],
    this.listsMenu = const [],
    this.tagsMenu = const [],
    this.selectedIdx = 0,
    this.pageCount = 1,
  });

  TodoState copyWith({
    List<TaskItem>? tasks,
    List<TaskMenuItem>? tasksMenu,
    List<ListMenuItem>? listsMenu,
    List<TagMenuItem>? tagsMenu,
    int? selectedIdx,
    int? pageCount,
  }) {
    return TodoState(
      tasks: tasks ?? this.tasks,
      tasksMenu: tasksMenu ?? this.tasksMenu,
      listsMenu: listsMenu ?? this.listsMenu,
      tagsMenu: tagsMenu ?? this.tagsMenu,
      selectedIdx: selectedIdx ?? this.selectedIdx,
      pageCount: pageCount ?? this.pageCount,
    );
  }
}
