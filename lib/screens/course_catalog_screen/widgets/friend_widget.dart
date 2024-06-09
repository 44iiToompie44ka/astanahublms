import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class FriendWidget extends StatelessWidget {
  const FriendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 200, 
            width: MediaQuery.of(context).size.width/2.25,
            decoration: BoxDecoration(
              gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).highlightColor,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
        ),
              borderRadius: BorderRadius.circular(24),
               ), 
            child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Приведи друга получи скидку',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/svg/Bearsvg.svg",
                          semanticsLabel: 'Bear',
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomCenter,
                        ),
                        Positioned(
                          bottom: -5, 
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                },
                                child: Text('Принять участие в акции', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium,),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),);
  }
}



