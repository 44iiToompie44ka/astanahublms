import 'package:flutter/material.dart';

class SpeechBubbleWidget extends StatelessWidget {
  final String text;

  const SpeechBubbleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/speech_bubble.png',
              width: 300,
              height: 200,
            ),
            Positioned(
              top: 0,
              left: 20,
              right: 20,
              bottom: 25,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    width: 275,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
          ],
        ),
       Padding(
         padding: const EdgeInsets.only(left: 140.0),
         child: Image.asset(
                'assets/robot.png',
                width: 350,
                height: 225,
              ),
       ),
      ],
    );
  }
}
