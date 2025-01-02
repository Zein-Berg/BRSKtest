import 'package:brsk_test_2/feature/presentation/splash/cubit/splash_cubit.dart';
import 'package:brsk_test_2/feature/presentation/splash/cubit/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator_service.dart';
import '../pages/dashboard_page.dart';
import '../pages/login_page.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<SplashCubit>()..appStarted(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticatedState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
          } else if (state is AuthenticatedState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DashboardPage(),
                ));
          }
        },
        child: Scaffold(),
      ),
    );
  }
}
