import 'package:blocklogin/screen/app_bloc_observer.dart';
import 'package:blocklogin/bloc/auth_bloc.dart';
import 'package:blocklogin/screen/login_screen.dart';
import 'package:blocklogin/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Car Got',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Palette.backgroundColor,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
