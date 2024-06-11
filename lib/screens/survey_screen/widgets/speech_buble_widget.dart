import 'package:flutter/material.dart';

class SpeechBubbleWidget extends StatefulWidget {
  final String text;

  const SpeechBubbleWidget({Key? key, required this.text}) : super(key: key);

  @override
  _SpeechBubbleWidgetState createState() => _SpeechBubbleWidgetState();
}

class _SpeechBubbleWidgetState extends State<SpeechBubbleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                      widget.text,
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
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _animation.value),
              child: child,
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 140.0),
            child: Image.asset(
              'assets/robot.png',
              width: 350,
              height: 225,
            ),
          ),
        ),
      ],
    );
  }
}
