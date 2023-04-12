import 'package:flutter/material.dart';
import 'package:tic_tac_toe/flutter/presentation/pages/login_page.dart';
import 'package:tic_tac_toe/flutter/theme_helper/color_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: lightGrey,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(0xFF363333, primarySwatch),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: lightPink,
              displayColor: lightPink,
              fontFamily: 'Alkatra',
            ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              red,
            ),
            foregroundColor: MaterialStateProperty.all(
              lightPink,
            ),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
