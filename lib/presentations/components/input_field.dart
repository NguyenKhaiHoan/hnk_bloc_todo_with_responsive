import 'package:flutter/material.dart';
import 'package:todo_task_bloc_simple/constants/app_colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.focusNode,
    required this.textController,
    required this.label,
    required this.icons,
  });

  final FocusNode focusNode;
  final TextEditingController textController;
  final String label;
  final Icon icons;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: label == "Password" ? true : false,
      focusNode: focusNode,
      controller: textController,
      autofocus: false,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: HAppColor.hSecondaryBackgroundColor),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: HAppColor.hSecondaryBackgroundColor),
              borderRadius: BorderRadius.circular(10)),
          hintStyle:
              const TextStyle(color: HAppColor.hSecondaryBackgroundColor),
          filled: true,
          fillColor: Colors.transparent,
          hintText: label,
          prefixIcon: icons),
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(focusNode);
      },
    );
  }
}
