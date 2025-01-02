import 'package:brsk_test_2/common/bloc/button_state.dart';
import 'package:brsk_test_2/common/bloc/button_state_cubit.dart';
import 'package:brsk_test_2/feature/presentation/pages/dashboard_page.dart';
import 'package:brsk_test_2/feature/presentation/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../locator_service.dart';
import '../widgets/sign_in_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xABF4C27F),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: BlocProvider(
                create: (context) => sl<ButtonStateCubit>(),
                child: BlocConsumer<ButtonStateCubit, ButtonState>(
                    listener: (context, state) {
                  if (state is ButtonFailureState) {
                    // failure
                    var snackbar = SnackBar(
                      content: Text(state.errorMessage),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                  if (state is ButtonSuccessState) {
                    // new page?
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                      (Route<dynamic> route) =>
                          false, // Удаляет все предыдущие маршруты
                    );
                  }
                }, builder: (context, state) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 44, right: 44),
                            child:
                                Image.asset('assets/images/welcome_image.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Welcome back\n',
                                  ),
                                  const TextSpan(
                                    text: 'to\n',
                                  ),
                                  TextSpan(
                                    text: 'OUR REMINDER',
                                    style: GoogleFonts.poppins(
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // email text field
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 64, left: 30, right: 30),
                            child: Container(
                              height: 51,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: TextField(
                                  controller: _emailController,
                                  obscureText: false,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your email',
                                    hintStyle: GoogleFonts.poppins(
                                      color: const Color(0xB2000000),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // password text field
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25, left: 30, right: 30),
                            child: Container(
                              height: 51,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: TextField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter password',
                                    hintStyle: GoogleFonts.poppins(
                                      color: const Color(0xB2000000),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Forgot password btn
                          Padding(
                            padding: const EdgeInsets.only(top: 64),
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forgot Password',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          // Sign In btn
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 64, left: 30, right: 30),
                            child: SignInButton(
                              emailController: _emailController,
                              passwordController: _passwordController,
                            ),
                          ),
                          // Sing Up
                          Padding(
                            padding: const EdgeInsets.only(top: 21.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account ?',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    ' Sign Up',
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFFD8605B),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      if (state is ButtonLoadingState)
                        Container(
                          child: const Center(
                            child: CircularProgressIndicator(
                                color: Color.fromRGBO(216, 96, 91, 1)),
                          ),
                        ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Успешная аутентификация
    } on FirebaseAuthException catch (e) {
      // Обработка ошибок аутентификации
      if (e.code == 'user-not-found') {
        print('Пользователь не найден.');
      } else if (e.code == 'wrong-password') {
        print('Неверный пароль.');
      } else {
        print('Ошибка: ${e.message}');
        print('email: ${_emailController.text}');
        print('password: ${_passwordController.text}');
      }
    } catch (e) {
      print('Ошибка: $e');
    }
  }
}
