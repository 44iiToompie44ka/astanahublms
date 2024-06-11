import 'package:astanahublmss/screens/survey_screen/utils.dart';
import 'package:astanahublmss/screens/survey_screen/widgets/speech_buble_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/survey_question.dart';
import '../widgets/option_widget.dart';
import 'package:confetti/confetti.dart';

class Question7 extends SurveyQuestion {
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
            SpeechBubbleWidget(text: getSpeechBubbleText(6),),
      
          buildOption("Рекомендация друзей или коллег", context, toggleOption, selectedOptions),
          buildOption("Поиск в интернете", context, toggleOption, selectedOptions),
          buildOption("Социальные сети", context, toggleOption, selectedOptions),
          buildOption("Реклама", context, toggleOption, selectedOptions),
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Другое (пожалуйста, уточните):",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: otherController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              controllerCenter.play();
              nextQuestion();
            },
            child: const Text(
              "Далее",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
