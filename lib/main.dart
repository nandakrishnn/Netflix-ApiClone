import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/homescreens/splash.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor:bagroundColor ,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          // ignore: deprecated_member_use
          textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white,),
        bodyText2: TextStyle(color: Colors.white,)
        ),
        
        // ignore: deprecated_member_use
        backgroundColor: Colors.black
      ),
      home: const SplashScreen(),
    );
  }
}