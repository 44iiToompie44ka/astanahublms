import 'package:astanahublmss/root/root_screen.dart';
import 'package:astanahublmss/screens/survey_screen/questions/question1.dart';
import 'package:astanahublmss/screens/survey_screen/questions/question2.dart';
import 'package:astanahublmss/screens/survey_screen/questions/question3.dart';
import 'package:astanahublmss/screens/survey_screen/questions/question4.dart';
import 'package:astanahublmss/screens/survey_screen/questions/question5.dart';
import 'package:astanahublmss/screens/survey_screen/questions/question6.dart';
import 'package:astanahublmss/screens/survey_screen/questions/question7.dart';
import 'package:astanahublmss/screens/survey_screen/questions/question8.dart';
import 'package:astanahublmss/screens/survey_screen/questions/question9.dart';
import 'package:astanahublmss/screens/survey_screen/widgets/survey_question.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class SurveyMainScreen extends StatefulWidget {
  const SurveyMainScreen({super.key});

  @override
  _SurveyMainScreenState createState() => _SurveyMainScreenState();
}

class _SurveyMainScreenState extends State<SurveyMainScreen> {
  int _currentQuestionIndex = 0;
  List<String> _selectedOptions = [];
  TextEditingController _otherController = TextEditingController();
  late ConfettiController _controllerCenter;

  final List<SurveyQuestion> _questions = [
    Question1(),
    Question2(),
    Question3(),
    Question4(),
    Question5(),
    Question6(),
    Question7(),
    Question8(),
    Question9(),
  ];

  @override
  void initState() {
    super.initState();
    _controllerCenter = ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        print("$_selectedOptions");
      });
    } else {
      print("Selected Options: $_selectedOptions");
      print("Other: ${_otherController.text}");
Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const RootScreen()),
            );    }
  }

  void _toggleOption(String option) {
    setState(() {
      if (_selectedOptions.contains(option)) {
        _selectedOptions.remove(option);
      } else {
        _selectedOptions.add(option);
      }
    });
  }

  String _getSpeechBubbleText(int index) {
    switch (index) {
      case 0:
        return "Какие курсы вас интересуют больше всего?";
      case 1:
        return "Какой у вас уровень опыта в IT?";
      case 2:
        return "Какие форматы обучения вы предпочитаете?";
      case 3:
        return "Как часто вы готовы заниматься обучением?";
      case 4:
        return "Какие временные интервалы для вас наиболее удобны для занятий?";
      case 5:
        return "Какие функции или особенности приложения вы считаете наиболее полезными?";
      case 6:
        return "Как вы узнали о нашем приложении?";
      default:
        return "Спасибо за участие в опросе!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Опрос"),
        leading: const SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                
                _questions[_currentQuestionIndex].build(
                  context,
                  _toggleOption,
                  _nextQuestion,
                  _selectedOptions,
                  _otherController,
                  _controllerCenter,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
