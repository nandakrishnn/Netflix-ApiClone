import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/presentation/Downloads/widgets/main_page/widegts/screen_main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoMain(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Lottie.network('https://lottie.host/c9ec986b-8b69-4e11-933c-22376683fe7b/FyoL8aZTs3.json',width: 200),
      
        
      ),
    );
  }
}

gotoMain(context) {
  Timer(const Duration(seconds: 6), () {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => ScreenMainPage()));
  });
}
