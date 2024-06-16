import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_bloc_simple/blocs/login/login_cubit.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/presentations/screens/login/widgets/form_login.dart';
import 'package:todo_task_bloc_simple/presentations/screens/login/widgets/form_with_background.dart';
import 'package:todo_task_bloc_simple/presentations/screens/todo/todo_screen.dart';
import 'package:todo_task_bloc_simple/repositories/auth_repo.dart';
import 'package:todo_task_bloc_simple/utils.dart';

import '../../../constants/app_sizes.dart';

class LoginScreen extends StatelessWidget {
  static const String route = "LoginScreen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context.read<AuthRepo>()),
      child: const Page(),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    int pageCount = 0;
    if (width <= 600) {
      pageCount = 1;
    } else {
      pageCount = 2;
    }
    context.read<LoginCubit>().setPageCount(pageCount);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.loadStatus == LoadStatus.Error) {
          HUtils.notificationBottom('Fail to login', true);
        } else if (state.loadStatus == LoadStatus.Done) {
          Navigator.of(context).pushNamed(TodoScreen.route);
        }
      },
      builder: (context, state) {
        return state.loadStatus == LoadStatus.Loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: HAppColor.hSecondaryBackgroundColor,
                ),
              )
            : Scaffold(
                body: Padding(
                  padding: hAppDefaultPaddingLTRB,
                  child: switch (pageCount) {
                    == 1 => const FormLogin(),
                    == 2 => const FormWithBackground(),
                    _ => const FormLogin(),
                  },
                ),
              );
      },
    );
  }
}
