import 'package:blocklogin/bloc/auth_bloc.dart';
import 'package:blocklogin/screen/home_screen.dart';
import 'package:blocklogin/widgets/gradient_button.dart';
import 'package:blocklogin/widgets/login_field.dart';
import 'package:blocklogin/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error,
                  ),
                ),
              );
            }

            if (state is AuthSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/signin_balls.png'),
                    ),
                    const Text(
                      'Sign in.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(height: 50),
                    const SocialButton(
                      iconPath: 'assets/svgs/g_logo.svg',
                      label: 'Continue with Google',
                    ),
                    const SizedBox(height: 20),
                    const SocialButton(
                        iconPath: 'assets/svgs/f_logo.svg',
                        label: 'Continue with Facebook',
                        horizontalPadding: 40),
                    const SizedBox(height: 15),
                    const Text(
                      'or',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 15),
                    LoginField(
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    const SizedBox(height: 15),
                    LoginField(
                      hintText: 'Password',
                      controller: passwordController,
                    ),
                    const SizedBox(height: 20),
                    GradientButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthLoginRequested(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
