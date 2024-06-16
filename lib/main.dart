import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_bloc_simple/constants/app_theme.dart';
import 'package:todo_task_bloc_simple/presentations/routes/routes.dart';
import 'package:todo_task_bloc_simple/presentations/screens/login/login_screen.dart';
import 'package:todo_task_bloc_simple/repositories/auth_repo.dart';
import 'package:todo_task_bloc_simple/repositories/auth_repo_impl.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(RepositoryProvider<AuthRepo>(
    create: (context) => AuthRepoImpl(),
    child: const MyApp(),
  ));
}

class SimpleBlocObserver extends BlocObserver {
  const SimpleBlocObserver();

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    print('onCreate -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    print('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    print('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    print('onClose -- bloc: ${bloc.runtimeType}');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: MaterialApp(
        theme: HAppTheme().lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: mainRoute,
        initialRoute: LoginScreen.route,
        home: const SafeArea(
          child: Scaffold(),
        ),
      ),
    );
  }
}
