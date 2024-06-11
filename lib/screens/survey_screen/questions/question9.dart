import 'package:astanahublmss/screens/survey_screen/widgets/speech_buble_widget.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import '../utils.dart'; // Import the utils file
import '../widgets/survey_question.dart';

class Question9 extends SurveyQuestion {
  @override
  Widget build(
    BuildContext context,
    Function(String) toggleOption,
    VoidCallback nextQuestion,
    List<String> selectedOptions,
    TextEditingController otherController,
    ConfettiController controllerCenter,
  ) {
    List<Widget> suggestions = getCourseSuggestions(selectedOptions);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (suggestions.isNotEmpty)
          const SpeechBubbleWidget(
            text: "Мы подобрали для вас курсы, опираясь на ваши ответы!",
          ),
          if (suggestions.isEmpty)
          const SpeechBubbleWidget(
            text: "Мы долго искали, но не смогли подобрать для вас курсы :(",
          ),
          const SizedBox(height: 20),
        if (suggestions.isNotEmpty)                  
          Container(
              margin: const EdgeInsets.all(4),
              height: 500,
              child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: suggestions,
              ),
            ),
          ElevatedButton(
            onPressed: nextQuestion,
            child: const Text(
            "В меню",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
