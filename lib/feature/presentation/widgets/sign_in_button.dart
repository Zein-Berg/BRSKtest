import 'package:brsk_test_2/feature/domain/use_cases/sign_in_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/bloc/button_state_cubit.dart';
import '../../../locator_service.dart';

class SignInButton extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95; // Уменьшаем размер при нажатии
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0; // Возвращаем размер при отпускании
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0; // Возвращаем размер, если нажатие отменено
    });
  }

  Future<void> signIn() async {
    context.read<ButtonStateCubit>().execute(
          useCase: sl<SignInUseCase>(),
          params: SignInParams(
            email: widget.emailController.text,
            password: widget.passwordController.text,
          ),
        );
    widget.emailController.clear();
    widget.passwordController.clear();
    //final useCase = sl<SignInUseCase>();
    //useCase(SignInParams(
    //  email: widget.emailController.text,
    //  password: widget.passwordController.text,
    //));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () async {
        await signIn();
      },
      child: Transform.scale(
        scale: _scale,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 17),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(244, 194, 127, 1),
                Color.fromRGBO(216, 96, 91, 1),
              ],
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                offset: Offset(0, 6),
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
