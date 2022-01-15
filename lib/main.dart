import 'package:flutter/material.dart';
import 'package:watch_it/constant.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:watch_it/page_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Watch It',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: spashScreen(),
    );
  }

  Widget spashScreen() {
    return AnimatedSplashScreen.withScreenFunction(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png"),
          const CircularProgressIndicator(
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: kPrimaryColor,
      splashIconSize: double.maxFinite,
      screenFunction: _navigate,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
    );
  }

  Future<Widget> _navigate() async {
    await Future.delayed(const Duration(seconds: 50));
    return const Page2();
  }
}
