import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../theme.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();

    Timer(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/map.json', width: 250, height: 250, animate: true),
              SizedBox(
                height: 30,
              ),
              Text(
                'SIWIKODE',
                style: TextStyle(
                    fontSize: 35,
                    color: redColor,
                    fontWeight: semiBold),
              ),
              SizedBox(height: 5,),
              Text(
                'Discover Your Travel Experience',
                style: TextStyle(
                    fontSize: 20,
                    color: darkGreyColor,
                    fontWeight: light),
              )
            ],
          )),
    );
  }
}
