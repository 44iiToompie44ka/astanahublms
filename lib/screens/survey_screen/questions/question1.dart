import 'package:astanahublmss/screens/survey_screen/utils.dart';
import 'package:astanahublmss/screens/survey_screen/widgets/speech_buble_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/survey_question.dart';
import '../widgets/option_widget.dart';
import 'package:confetti/confetti.dart';

class Question1 extends SurveyQuestion {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpeechBubbleWidget(text: getSpeechBubbleText(0),),
          const SizedBox(height: 10),
          buildOption("Веб-разработка", context, toggleOption, selectedOptions),
          buildOption("Мобильная разработка", context, toggleOption, selectedOptions),
          buildOption("Машинное обучение и ИИ", context, toggleOption, selectedOptions),
          buildOption("Кибербезопасность", context, toggleOption, selectedOptions),
          buildOption("Анализ данных и Big Data", context, toggleOption, selectedOptions),
          buildOption("Сетевое администрирование", context, toggleOption, selectedOptions),
          buildOption("Базы данных", context, toggleOption, selectedOptions),
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
            onPressed: nextQuestion,
            child: const Text("Далее"),
          ),
        ],
      ),
    );
  }
}
