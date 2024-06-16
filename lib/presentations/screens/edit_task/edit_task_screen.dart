import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_task_bloc_simple/blocs/todo/todo_cubit.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/constants/app_sizes.dart';
import 'package:todo_task_bloc_simple/constants/app_style.dart';
import 'package:todo_task_bloc_simple/presentations/screens/todo/todo_screen.dart';

class EditTaskScreen extends StatefulWidget {
  static const String route = "EditTaskScreen";
  final bool isAddMode;
  final int oldPageCount;

  const EditTaskScreen(
      {super.key, this.isAddMode = false, required this.oldPageCount});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  var selectedListItemString = '';
  var selectedDueDateString = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        if (state.selectedIdx == -1) {
          return const Center(
            child: Text(
              'No tasks are displayed',
              style: HAppStyle.paragraph2Regular,
            ),
          );
        }

        var listsMenu = state.listsMenu;

        var title = TextEditingController(text: "");
        var description = TextEditingController(text: "");
        var selectedListItem = listsMenu[0];
        selectedListItemString = selectedListItem.title;
        var selectedDuaDate = DateTime.now();
        var cubit = context.read<TodoCubit>();
        if (!widget.isAddMode) {
          var task = state.tasks[state.selectedIdx];
          title.text = task.title;
          description.text = task.description;
          selectedListItem = task.listMenuItem;
          selectedListItemString = selectedListItem.title;
          selectedDuaDate = task.duaDate;
          selectedDueDateString =
              DateFormat('dd-MM-yyyy').format(selectedDuaDate);
        }
        var newPageCount = state.pageCount;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Task:',
                    style: HAppStyle.heading4Style,
                  ),
                  gapH24,
                  TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: HAppColor.hSelectedSectionColor,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    style: HAppStyle.paragraph2Regular,
                  ),
                  gapH10,
                  TextFormField(
                    controller: description,
                    minLines: 8,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    maxLength: 1000,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: HAppColor.hSelectedSectionColor,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    style: HAppStyle.paragraph2Regular,
                  ),
                  gapH10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                          flex: 1,
                          child: Text(
                            'List',
                            style: HAppStyle.paragraph2Bold,
                          )),
                      gapW10,
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            DropdownButton(
                              value: selectedListItemString,
                              onChanged: (newValue) {
                                setState(() {
                                  var listItem = selectedListItem.title;
                                  listItem = newValue!;
                                  selectedListItem = listsMenu.firstWhere(
                                      (item) => item.title == listItem);
                                  selectedListItemString =
                                      selectedListItem.title;
                                });
                              },
                              style: HAppStyle.paragraph2Regular,
                              items: listsMenu
                                  .map((item) => item.title)
                                  .toList()
                                  .map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                            ),
                            const Spacer()
                          ],
                        ),
                      ),
                    ],
                  ),
                  gapH10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                          flex: 1,
                          child: Text(
                            'Due date',
                            style: HAppStyle.paragraph2Bold,
                          )),
                      gapW10,
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            DropdownButton(
                              value: selectedDueDateString,
                              onChanged: (newValue) async {
                                var date = DateTime.now();
                                await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(2024),
                                  lastDate: DateTime(2025),
                                ).then((pickedDate) {
                                  setState(() {
                                    selectedDuaDate =
                                        pickedDate ?? selectedDuaDate;
                                    selectedDueDateString =
                                        DateFormat('dd-MM-yyyy')
                                            .format(selectedDuaDate);
                                  });
                                });
                              },
                              style: HAppStyle.paragraph2Regular,
                              items: [
                                DateFormat('dd-MM-yyyy')
                                    .format(selectedDuaDate),
                                'Choose date'
                              ].map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Container(
              padding: hAppDefaultPaddingT,
              color: !widget.isAddMode
                  ? HAppColor.hSecondaryBackgroundColor
                  : HAppColor.hPrimaryBackgroundColor,
              child: Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {
                            if (!widget.isAddMode) {
                              cubit.removeTask(state.selectedIdx);
                              if (widget.oldPageCount < 3) {
                                if (widget.oldPageCount == newPageCount) {
                                  Navigator.of(context).pop();
                                } else {
                                  Navigator.of(context).popUntil(
                                      ModalRoute.withName(TodoScreen.route));
                                }
                              }
                            } else {
                              Navigator.of(context).pop();
                            }
                          },
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  width: 2.0,
                                  color: HAppColor.hSelectedSectionColor)),
                          child: Text(
                            !widget.isAddMode ? "Remove task" : 'Cancel',
                            style: HAppStyle.paragraph2Bold,
                            textAlign: TextAlign.center,
                          ))),
                  gapW10,
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (!widget.isAddMode) {
                              cubit.editTask(
                                state.selectedIdx,
                                title.text,
                                description.text,
                                selectedListItem,
                                selectedDuaDate,
                              );
                              if (widget.oldPageCount < 3) {
                                //3 don't need back
                                if (widget.oldPageCount == newPageCount) {
                                  Navigator.of(context).pop();
                                } else {
                                  Navigator.of(context).popUntil(
                                      ModalRoute.withName(TodoScreen.route));
                                }
                              }
                            } else {
                              cubit.addTask(title.text, description.text,
                                  selectedListItem, selectedDuaDate);
                              Navigator.of(context).pop();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: HAppColor.hYellowColor),
                          child: Text(
                            !widget.isAddMode ? "Save changes" : 'Add task',
                            style: HAppStyle.paragraph2Bold,
                            textAlign: TextAlign.center,
                          )))
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
