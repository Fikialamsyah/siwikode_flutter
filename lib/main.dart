import 'package:flutter/material.dart';
import 'package:siwikode_v2/pages/detail_page.dart';
import 'package:siwikode_v2/pages/home_page.dart';
import 'package:siwikode_v2/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
