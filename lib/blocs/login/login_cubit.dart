import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_task_bloc_simple/models/login.dart';
import 'package:todo_task_bloc_simple/repositories/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(const LoginState.init());

  final AuthRepo authRepo;

  Future<void> checkLogin(Login login) async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    var result = await authRepo.checkLogin(login);
    print(login.username);
    print(login.password);
    print(result);
    if (result) {
      emit(state.copyWith(loadStatus: LoadStatus.Done));
    } else {
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }

  void setPageCount(int pageCount) {
    emit(state.copyWith(pageCount: pageCount));
  }
}
