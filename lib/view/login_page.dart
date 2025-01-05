import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:something/bloc/auth_bloc/auth_bloc.dart';
import 'package:something/model/user_model.dart';
import 'package:something/view/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthStatus && !state.authStatus) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      'Please check your username and password',
                    ),
                  ),
                );
              }
              if (state is AuthStatus && state.authStatus) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      'Success',
                    ),
                  ),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              }
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: username,
                      decoration: const InputDecoration(
                          labelText: 'Username', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: password,
                      decoration: const InputDecoration(
                          labelText: 'Password', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              LoginEvent(
                                userModel: UserModel(
                                  username: username.text,
                                  password: password.text,
                                ),
                              ),
                            );
                      },
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is Laoding) {
                            return const CircularProgressIndicator();
                          } else {
                            return const Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Janna LT',
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
