import 'dart:async';
import 'package:flutter/material.dart';
import 'package:taskyapp/Screens/welcomPage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomePage() ,
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {  return Scaffold(
    backgroundColor: Color(0xff1B1B1B),

    body: Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff0B3827),
                  Color(0xff151515),
                  Color(0xff0B3827),
                ]
            )
        ),
        child: Center(
          child: Container(
            width: 115,
            height: 115,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/Frame 43.png'),
          ),
        ),
      ),
    ),
  );
  }
}
