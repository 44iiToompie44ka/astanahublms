import 'package:astanahublmss/screens/survey_screen/utils.dart';
import 'package:astanahublmss/screens/survey_screen/widgets/speech_buble_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/survey_question.dart';
import '../widgets/option_widget.dart';
import 'package:confetti/confetti.dart';

class Question3 extends SurveyQuestion {
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
                    SpeechBubbleWidget(text: getSpeechBubbleText(2),),
      
          buildOption("Видеоуроки", context, toggleOption, selectedOptions),
          buildOption("Интерактивные курсы", context, toggleOption, selectedOptions),
          buildOption("Вебинары и онлайн-лекции", context, toggleOption, selectedOptions),
          buildOption("Текстовые материалы и книги", context, toggleOption, selectedOptions),
          buildOption("Практические проекты", context, toggleOption, selectedOptions),
          buildOption("Форумы и группы для обсуждения", context, toggleOption, selectedOptions),
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
