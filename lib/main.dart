import 'package:astanahublmss/root/themes.dart';
import 'package:astanahublmss/screens/survey_screen/survey_main_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme, 
      home: const SurveyMainScreen(),
    );
  }
}
