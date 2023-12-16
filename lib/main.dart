import 'package:fitnessapp/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MainAPP());
}

class MainAPP extends StatelessWidget {
  const MainAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
