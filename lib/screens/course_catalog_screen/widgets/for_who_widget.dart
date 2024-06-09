import 'dart:async';
import 'package:flutter/material.dart';

class ForWhoWidget extends StatefulWidget {
  @override
  _ForWhoWidgetState createState() => _ForWhoWidgetState();
}

class _ForWhoWidgetState extends State<ForWhoWidget> {
  final List<String> _imagePaths = [
    'assets/ui/for_who/1st.png',
    'assets/ui/for_who/2nd.png',
    'assets/ui/for_who/3rd.png',
    'assets/ui/for_who/4th.png',
  ];
  final List<String> _imageTexts = [
    'Начинающим',
    'Опытным',
    'Меняющим свою \nсферу \nдеятельности',
    'Школьникам и \nстудентам',
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startImageChangeTimer();
  }

  void _startImageChangeTimer() {
    _timer = Timer.periodic(Duration(seconds: 2, milliseconds: 500), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imagePaths.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width / 2.65,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              _imagePaths[_currentIndex],
              height: 200,
              fit: BoxFit.cover,
              key: ValueKey(_imagePaths[_currentIndex]),
            ),
            const Positioned(
              top: 10,
              child: Text(
                "Кому подходит?",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            if (_currentIndex != 2)
            Positioned(
              top: 140,
              child: Text(
                maxLines: 3,
                textAlign: TextAlign.center,
                _imageTexts[_currentIndex],
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            if (_currentIndex == 2)
              Positioned(
              top: 115,
              child: Text(
                maxLines: 3,
                textAlign: TextAlign.center,
                _imageTexts[_currentIndex],
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}