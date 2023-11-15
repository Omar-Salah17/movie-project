import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamed(context, AppRouter.kHomeScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          '$imagePath/logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
