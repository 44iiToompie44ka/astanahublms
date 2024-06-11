import 'package:astanahublmss/screens/survey_screen/utils.dart';
import 'package:astanahublmss/screens/survey_screen/widgets/speech_buble_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/survey_question.dart';
import '../widgets/option_widget.dart';
import 'package:confetti/confetti.dart';

class Question5 extends SurveyQuestion {
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
          SpeechBubbleWidget(text: getSpeechBubbleText(4),),
      
          buildOption("Утро (6:00 - 12:00)", context, toggleOption, selectedOptions),
          buildOption("День (12:00 - 18:00)", context, toggleOption, selectedOptions),
          buildOption("Вечер (18:00 - 22:00)", context, toggleOption, selectedOptions),
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
