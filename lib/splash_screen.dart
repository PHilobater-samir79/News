import 'package:flutter/material.dart';
import 'package:news_app/home/Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName ='SplashScreen' ;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5),() {
      Navigator.pushReplacementNamed(context, home.routeName);
    },);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/images/splash.png',fit: BoxFit.cover,),
    );
  }
}
