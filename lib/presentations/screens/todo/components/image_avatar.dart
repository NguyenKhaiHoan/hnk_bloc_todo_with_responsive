import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_bloc_simple/constants/app_style.dart';
import 'package:todo_task_bloc_simple/models/user.dart';
import 'package:todo_task_bloc_simple/repositories/auth_repo.dart';

class ImageAvatar extends StatelessWidget {
  const ImageAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    User user = context.read<AuthRepo>().getUerInformation();
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.imageUrl),
      ),
      title: Text(
        user.fullName,
        style: HAppStyle.paragraph2Regular,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {},
    );
  }
}
