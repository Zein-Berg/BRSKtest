import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xABF4C27F),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 44, right: 44),
                    child: Image.asset('assets/images/welcome_image.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Get\'s things done\nwith TODO',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Let\'s help you meet up your tasks',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Color(0xBD000000),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  // full name text field
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 30, right: 30),
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
                          obscureText: false,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your full name',
                            hintStyle: GoogleFonts.poppins(
                              color: const Color(0xB2000000),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // email text field
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 30, right: 30),
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
                    padding:
                        const EdgeInsets.only(top: 16, left: 30, right: 30),
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 30, right: 30),
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
                          obscureText: true,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm password',
                            hintStyle: GoogleFonts.poppins(
                              color: const Color(0xB2000000),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Register btn
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 64, left: 30, right: 30),
                    child: GestureDetector(
                      onTap: () {},
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
                            )
                          ],
                        ),
                        child: Text(
                          'Register',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  // Sing In redirect
                  Padding(
                    padding: const EdgeInsets.only(top: 21.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account ?',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            ' Sign In',
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
            ),
          ),
        ),
      ),
    );
  }
}
