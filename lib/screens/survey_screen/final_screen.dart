import 'package:astanahublmss/screens/survey_screen/widgets/speech_buble_widget.dart';
import 'package:astanahublmss/screens/survey_screen/widgets/survey_question.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class FinalScreen extends SurveyQuestion {
  @override
  Widget build(
    BuildContext context,
    Function(String) toggleOption,
    VoidCallback nextQuestion,
    List<String> selectedOptions,
    TextEditingController otherController,
    ConfettiController controllerCenter,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SpeechBubbleWidget(text: "Спасибо за участие в опросе! Ваши ответы будут учтены",),
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: controllerCenter,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: true,
            colors: const [
              Colors.red,
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.purple,
              Colors.orange,
            ],
          ),
        ),
        const SizedBox(height: 100),
        ElevatedButton(
          onPressed: nextQuestion,
          child: const Text(
            "Далее",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
