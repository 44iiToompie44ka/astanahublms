import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

abstract class SurveyQuestion {
  Widget build(
    BuildContext context,
    Function(String) toggleOption,
    VoidCallback nextQuestion,
    List<String> selectedOptions,
    TextEditingController otherController,
    ConfettiController controllerCenter,
  );
}

Widget _buildOption(String option, BuildContext context, Function(String) toggleOption, List<String> selectedOptions) {
  return GestureDetector(
    onTap: () => toggleOption(option),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: selectedOptions.contains(option)
            ? Theme.of(context).primaryColor
            : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Text(
        option,
        style: TextStyle(
          color: selectedOptions.contains(option)
              ? Colors.white
              : Theme.of(context).primaryColor,
          fontSize: 16,
        ),
      ),
    ),
  );
}
