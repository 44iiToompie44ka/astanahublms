import 'package:astanahublmss/screens/survey_screen/utils.dart';
import 'package:astanahublmss/screens/survey_screen/widgets/speech_buble_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/survey_question.dart';
import '../widgets/option_widget.dart';
import 'package:confetti/confetti.dart';

class Question6 extends SurveyQuestion {
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
            SpeechBubbleWidget(text: getSpeechBubbleText(5),),
      
          buildOption("Личные кабинеты и профиль достижений", context, toggleOption, selectedOptions),
          buildOption("Система тестов и экзаменов", context, toggleOption, selectedOptions),
          buildOption("Сертификаты по окончании курсов", context, toggleOption, selectedOptions),
          buildOption("Поддержка наставников и менторов", context, toggleOption, selectedOptions),
          buildOption("Общение и сети с другими студентами", context, toggleOption, selectedOptions),
          buildOption("Доступ к актуальным новостям и статьям в IT", context, toggleOption, selectedOptions),
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
