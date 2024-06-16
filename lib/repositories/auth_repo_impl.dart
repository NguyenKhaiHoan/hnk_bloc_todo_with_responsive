import 'package:todo_task_bloc_simple/models/login.dart';
import 'package:todo_task_bloc_simple/models/user.dart';
import 'package:todo_task_bloc_simple/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<bool> checkLogin(Login login) async {
    await Future.delayed(const Duration(seconds: 2));
    if (login.username == 'admin' && login.password == 'admin') {
      saveUerInformation(const User(
          fullName: 'Nguyen Khai Hoan',
          imageUrl:
              'https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-1/385879398_633209478927951_7778506859684996693_n.jpg?stp=dst-jpg_p200x200&_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=9uE67zsDHFYQ7kNvgHsH5Iw&_nc_ht=scontent.fhan14-3.fna&oh=00_AYCvfwMMssYfXRws7X_oezsw9eUeUxeda46yrPvXclmZHQ&oe=6674E059'));
      return true;
    }
    return false;
  }

  @override
  User getUerInformation() {
    return _user;
  }

  @override
  void saveUerInformation(User user) {
    _user = user;
  }

  late User _user;
}
