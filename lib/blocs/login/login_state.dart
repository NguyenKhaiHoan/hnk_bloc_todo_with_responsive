part of 'login_cubit.dart';

enum LoadStatus { Init, Loading, Error, Done }

class LoginState extends Equatable {
  final LoadStatus loadStatus;
  final int pageCount;

  const LoginState.init({
    this.loadStatus = LoadStatus.Init,
    this.pageCount = 1,
  });

  const LoginState({
    required this.loadStatus,
    required this.pageCount,
  });

  @override
  List<Object?> get props => [loadStatus, pageCount];

  LoginState copyWith({
    LoadStatus? loadStatus,
    int? pageCount,
  }) {
    return LoginState(
      loadStatus: loadStatus ?? this.loadStatus,
      pageCount: pageCount ?? this.pageCount,
    );
  }
}
