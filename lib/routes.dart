import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/constants/app_sizes.dart';
import 'package:todo_task_bloc_simple/screens/dash_board/dash_board_cubit.dart';
import 'package:todo_task_bloc_simple/screens/dash_board/dash_board_screen.dart';
import 'package:todo_task_bloc_simple/screens/edit_task/edit_task_screen.dart';
import 'package:todo_task_bloc_simple/screens/login/login_screen.dart';
import 'package:todo_task_bloc_simple/screens/task_detail/task_detail_screen.dart';

Route<dynamic>? mainRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.route:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case DashBoardScreen.route:
      return MaterialPageRoute(
          builder: (context) => const DashBoardScreen(),
          settings: const RouteSettings(name: DashBoardScreen.route));
    case TaskDetailScreen.route:
      var cubit = (settings.arguments as Map<String, dynamic>)['cubit']
          as DashBoardCubit;
      return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
                value: cubit,
                child: const Scaffold(body: TaskDetailScreen()),
              ));
    case EditTaskScreen.route:
      var cubit = (settings.arguments as Map<String, dynamic>)['cubit']
          as DashBoardCubit;
      var isAddMode = false;
      if ((settings.arguments as Map<String, dynamic>)['isAddMode'] != null) {
        isAddMode =
            (settings.arguments as Map<String, dynamic>)['isAddMode'] as bool;
      }
      return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
                value: cubit,
                child: Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: HAppColor.hPrimaryBackgroundColor,
                    ),
                    body: Padding(
                      padding: hAppDefaultPaddingLTRB,
                      child: EditTaskScreen(
                        isAddMode: isAddMode,
                        oldPageCount: cubit.state.pageCount,
                      ),
                    )),
              ));
    default:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
  }
}
