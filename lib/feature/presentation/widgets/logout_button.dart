import 'package:brsk_test_2/feature/domain/use_cases/sign_out_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/bloc/button_state_cubit.dart';
import '../../../locator_service.dart';

class LogOutButton extends StatefulWidget {
  const LogOutButton({super.key});

  @override
  State<LogOutButton> createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {
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

  Future<void> signOut() async {
    context.read<ButtonStateCubit>().execute(
          useCase: sl<SignOutUseCase>(),
          params: null,
        );
    //final useCase = sl<SignOutUseCase>();
    //useCase(null);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () async {
        await signOut();
      },
      child: Transform.scale(
        scale: _scale,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xFFF4C27F),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            'Log Out',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
