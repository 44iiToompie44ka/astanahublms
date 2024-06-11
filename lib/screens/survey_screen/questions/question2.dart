import 'package:astanahublmss/screens/survey_screen/utils.dart';
import 'package:astanahublmss/screens/survey_screen/widgets/speech_buble_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/survey_question.dart';
import '../widgets/option_widget.dart';
import 'package:confetti/confetti.dart';

class Question2 extends SurveyQuestion {
  @override
  Widget build(
    BuildContext context,
    Function(String) toggleOption,
    VoidCallback nextQuestion,
    List<String> selectedOptions,
    TextEditingController otherController,
    ConfettiController controllerCenter,
  ) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpeechBubbleWidget(text: getSpeechBubbleText(1),),
      
          buildOption("Начинающий (0-1 год опыта)", context, toggleOption, selectedOptions),
          buildOption("Средний (1-3 года опыта)", context, toggleOption, selectedOptions),
          buildOption("Продвинутый (более 3 лет опыта)", context, toggleOption, selectedOptions),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: nextQuestion,
            child: const Text("Далее"),
          ),
        ],
      ),
    );
  }
}
