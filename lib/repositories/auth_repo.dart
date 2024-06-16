import 'package:todo_task_bloc_simple/models/login.dart';
import 'package:todo_task_bloc_simple/models/user.dart';

abstract class AuthRepo {
  late User _user;

  Future<bool> checkLogin(Login login);

  User getUerInformation();

  void saveUerInformation(User user);
}
