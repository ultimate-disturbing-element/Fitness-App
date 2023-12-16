import 'package:fitnessapp/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  
  var pages=[
    PageViewModel(
  title: "Caring For Life",
  body: "When you start feeling the PAIN, that’s when EVERYTHING starts!",
  image: Center(child: Image.asset("assets/screen4.png", height: 175.0)),
  decoration: const PageDecoration(
    pageColor: Colors.orange,
  ),
),

 PageViewModel(
  title: "Changing Lives",
  body: "Life is a battle. But, don’t worry, you’re gonna lift heavy and win it too!",
  image: Center(child: Image.asset("assets/image4.jpg", height: 175.0)),
  decoration: const PageDecoration(
    pageColor: Colors.orange,
  ),
),

 PageViewModel(
  title: "Choose Will",
  body: "Your fitness is 100% mental! If your mind doesn’t push harder, your body goes nowhere!",
  image: Center(child: Image.asset("assets/image5.png", height: 175.0)),
  decoration: const PageDecoration(
    pageColor: Colors.orange,
  ),
),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: IntroductionScreen(pages: pages, 
       onDone: (){
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),);
       }, onSkip:(){
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),);
       },
      
  showSkipButton: true,
  skip: const Icon(Icons.skip_next),
  next: const Icon(Icons.arrow_right),
  done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
  dotsDecorator: DotsDecorator(
    size: const Size.square(10.0),
    activeSize: const Size(20.0, 10.0),
    activeColor: Colors. black,
    color: Colors.black26,
    spacing: const EdgeInsets.symmetric(horizontal: 3.0),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0)
    )
  ),
),
       );
    
  }
}