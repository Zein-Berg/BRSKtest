import 'package:brsk_test_2/feature/presentation/pages/login_page.dart';
import 'package:brsk_test_2/feature/presentation/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/bloc/button_state.dart';
import '../../../common/bloc/button_state_cubit.dart';
import '../../../locator_service.dart';
import '../widgets/clock_widget.dart';
import '../widgets/task_list.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocProvider<ButtonStateCubit>(
        create: (BuildContext context) => sl<ButtonStateCubit>(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
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
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) =>
                    false, // Удаляет все предыдущие маршруты
              );
            }
          },
          child: Column(
            children: [
              Container(
                color: const Color(0xABF4C27F),
                height: screenHeight * 0.38,
                child: SafeArea(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Container(
                            //width: 90,
                            //height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFF),
                              border: Border.all(
                                color: Color(0xFFD8605B),
                                width: 4.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CircleAvatar(
                                radius: screenWidth * 0.12,
                                backgroundImage: AssetImage(
                                  'assets/images/avatar.jpg',
                                  //width: 80,
                                  //height: 80,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // user Full Name

                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            'Ayase Momo',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),

                        // @username
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Text(
                            '@ayasemomo',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Color(0xFFD8605B),
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                        //logout btn
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 12, left: 30, right: 30),
                          child: LogOutButton(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // clock
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Clock(
                  width: screenWidth * 0.33,
                  height: screenWidth * 0.33,
                ),
              ),
              // Greeting
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  _getGreetingPhrase(),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xBF000000),
                  ),
                ),
              ),
              // TaskList label
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 16.0),
                  child: Text(
                    'Tasks List',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xBF000000),
                    ),
                  ),
                ),
              ),
              //task list
              TaskList(),
            ],
          ),
        ),
      ),
    );
  }

  String _getGreetingPhrase() {
    final int hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon";
    } else if (hour >= 17 && hour < 21) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }
}
