import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/view/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
@override


class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>const HomeScreen() ));
    });
  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height * 1;
    final width=MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/splash_pic.jpg',
            fit: BoxFit.cover,
            height:height * .5 ,
            ),
            SizedBox(
              height: height*0.04,
            ),
             Text("TOP HEADLINES",
            style: GoogleFonts.anton(letterSpacing: .6,color: Colors.grey.shade700),
            ),
             SizedBox(
              height: height*0.04,
            ),
          const  SpinKitChasingDots(
              color: Colors.blue,
              size: 40,
            )
            
          ],
        ),
      ),
    );
  }
}