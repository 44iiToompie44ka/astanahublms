import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserAccountMiniWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),         color: Theme.of(context).primaryColor,),
        width: double.infinity,
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(48),
                    child: Image.asset('assets/ui/user_picture_placeholder.png',
                    height: 48, width: 48,
                    
                    
                    ),
                  ),
                ),
              ],
            ),
          Padding(
             padding: const EdgeInsets.only(left: 32.0),
             child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Илья Кириченко', style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize, color: Colors.white)),
                  Row(
                    children: [
                      SvgPicture.asset("assets/svg/socialcoin.svg"),
                      const SizedBox(width: 6,),
                      Text('55', style: TextStyle(color: Colors.white, fontSize: Theme.of(context).textTheme.labelLarge?.fontSize),),
                      SizedBox(width: 6,),
                      SvgPicture.asset("assets/svg/xp.svg"),
                      const SizedBox(width: 6,),
                      Text('55', style: TextStyle(color: Colors.white, fontSize: Theme.of(context).textTheme.labelLarge?.fontSize),)
                    ],
                  ),
                ],
              ),
           )
          ],
        ),
      ),
    );
  }

}
