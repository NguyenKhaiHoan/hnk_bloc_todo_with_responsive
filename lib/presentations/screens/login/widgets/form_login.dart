import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_bloc_simple/blocs/login/login_cubit.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/constants/app_sizes.dart';
import 'package:todo_task_bloc_simple/constants/app_style.dart';
import 'package:todo_task_bloc_simple/models/login.dart';
import 'package:todo_task_bloc_simple/presentations/components/input_field.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({
    super.key,
  });

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  late TextEditingController usernameTextController;
  late TextEditingController passwordTextController;

  late FocusNode usernameFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode loginButtonFocusNode;

  @override
  void initState() {
    super.initState();
    usernameTextController = TextEditingController();
    passwordTextController = TextEditingController();

    usernameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    loginButtonFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    usernameTextController.clear();
    passwordTextController.clear();

    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    loginButtonFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Container(
            padding: const EdgeInsets.all(hAppDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Todo Movie App',
                  style: HAppStyle.label1Bold
                      .copyWith(color: HAppColor.hBlueColor),
                ),
                gapH40,
                const Text(
                  'Let\'s have fun experiencing todo and movie app together',
                  style: HAppStyle.label1Bold,
                ),
                gapH12,
                Text(
                  'Welcomeback, ',
                  style: HAppStyle.paragraph3Regular
                      .copyWith(color: HAppColor.hGreyColor),
                ),
                gapH24,
                InputField(
                  focusNode: usernameFocusNode,
                  textController: usernameTextController,
                  label: 'Username',
                  icons: const Icon(Icons.person),
                ),
                gapH12,
                InputField(
                  focusNode: passwordFocusNode,
                  textController: passwordTextController,
                  label: 'Password',
                  icons: const Icon(Icons.password),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        gapW6,
                        Text(
                          'Remember me',
                          style: HAppStyle.paragraph3Regular
                              .copyWith(color: HAppColor.hGreyColor),
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(
                      'Forget password?',
                      style: HAppStyle.paragraph3Regular
                          .copyWith(color: HAppColor.hGreyColor),
                    )
                  ],
                ),
                gapH40,
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<LoginCubit>().checkLogin(Login(
                              username: usernameTextController.text.trim(),
                              password: passwordTextController.text.trim()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: HAppColor.hYellowColor),
                        child: const Text(
                          'Login',
                          style: HAppStyle.paragraph2Bold,
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
                gapH40,
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     Text(
                //       'Or login with',
                //       style: HAppStyle.paragraph4Regular
                //           .copyWith(color: HAppColor.hBlueColor),
                //     ),
                //     const Spacer(),
                //     Row(
                //       children: [
                //         Text(
                //           'Facebook',
                //           style: HAppStyle.paragraph3Bold
                //               .copyWith(color: HAppColor.hBlueColor),
                //         ),
                //         const Spacer(),
                //         Text(
                //           'Forget password?',
                //           style: HAppStyle.paragraph3Bold
                //               .copyWith(color: HAppColor.hBlueColor),
                //         ),
                //         const Spacer(),
                //         Text(
                //           'Forget password?',
                //           style: HAppStyle.paragraph3Bold
                //               .copyWith(color: HAppColor.hBlueColor),
                //         ),
                //       ],
                //     ),
                //   ],
                // )
              ],
            ));
      },
    );
  }
}
