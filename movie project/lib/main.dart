import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: ,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: primaryBackgroundColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromRGBO(26, 26, 26, 1),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kYellow,
          unselectedItemColor: Color.fromRGBO(198, 198, 198, 1),
        ),
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
