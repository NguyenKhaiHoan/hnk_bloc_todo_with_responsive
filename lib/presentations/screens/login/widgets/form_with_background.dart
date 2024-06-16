import 'package:flutter/material.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';
import 'package:todo_task_bloc_simple/presentations/screens/login/widgets/form_login.dart';

class FormWithBackground extends StatelessWidget {
  const FormWithBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          color: HAppColor.hSecondaryBackgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(flex: 3, child: FormLogin()),
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/login/login_background.png',
                        ))),
              )),
        ],
      ),
    );
  }
}
