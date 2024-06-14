part of 'dash_board_cubit.dart';

class DashBoardState extends Equatable {
  final List<TaskItem> tasks;
  final List<TaskMenuItem> tasksMenu;
  final List<ListMenuItem> listsMenu;
  final List<TagMenuItem> tagsMenu;
  final int selectedIdx;
  final int pageCount;

  @override
  List<Object> get props => [tasks, selectedIdx, pageCount];

  const DashBoardState({
    this.tasks = const [],
    this.tasksMenu = const [],
    this.listsMenu = const [],
    this.tagsMenu = const [],
    this.selectedIdx = 0,
    this.pageCount = 1,
  });

  DashBoardState copyWith({
    List<TaskItem>? tasks,
    List<TaskMenuItem>? tasksMenu,
    List<ListMenuItem>? listsMenu,
    List<TagMenuItem>? tagsMenu,
    int? selectedIdx,
    int? pageCount,
  }) {
    return DashBoardState(
      tasks: tasks ?? this.tasks,
      tasksMenu: tasksMenu ?? this.tasksMenu,
      listsMenu: listsMenu ?? this.listsMenu,
      tagsMenu: tagsMenu ?? this.tagsMenu,
      selectedIdx: selectedIdx ?? this.selectedIdx,
      pageCount: pageCount ?? this.pageCount,
    );
  }
}
