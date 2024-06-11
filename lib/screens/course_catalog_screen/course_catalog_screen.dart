
import 'package:astanahublmss/screens/course_catalog_screen/widgets/course_catalog_grid_widget.dart';
import 'package:astanahublmss/screens/course_catalog_screen/widgets/for_who_widget.dart';
import 'package:astanahublmss/screens/course_catalog_screen/widgets/friend_widget.dart';
import 'package:astanahublmss/screens/course_catalog_screen/widgets/image_carousel.dart';
import 'package:flutter/material.dart';

class CourseCatalogScreen extends StatefulWidget {
  const CourseCatalogScreen({super.key});

  @override
  State<CourseCatalogScreen> createState() => _CourseCatalogScreenState();
}


class _CourseCatalogScreenState extends State<CourseCatalogScreen> {
  @override
  Widget build(BuildContext context) {
    bool showSurvey = true;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          
          body: ListView(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
          
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).highlightColor,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
            ),
                    ),
                    alignment: Alignment.center,
                  child: const Text('Привет, username! ✌️', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),),
                  
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FriendWidget(),
                const SizedBox(width: 15,),
                ForWhoWidget(),
        
        
                ],),
                const SizedBox(height: 16,),
        
              ImageCarousel(
            imageUrls: const [
              'https://edu.astanahub.com/img/startup.fb13b942.webp',
              'https://edu.astanahub.com/img/startup_academy.a0d1ebe0.webp',
              'https://edu.astanahub.com/img/nocode.eeca4e7c.webp',
              'https://edu.astanahub.com/img/betacareer.55cb954a.webp',
              'https://edu.astanahub.com/img/freelance.6194ce4d.webp',
            ], 
            imageTitle: const [
              'Startup School',
              'Startup Academy',
              'No Code School',
              'Beta Career',
              'Freelance School',
        
            ], imageMiniTitle: const [
              'Предпринимательство',
              'Предпринимательство',
              'Фриланс',
              'Карьера',
              'Фриланс', 
            ], pageUrls: const [
              'https://education.astanahub.com/startupschool',
              'https://education.astanahub.com/betacareer',
              'https://education.astanahub.com/nocode',
              'https://education.astanahub.com/betacareer',
              'https://education.astanahub.com/freelanceschool',
            ],
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Divider(thickness: 2,),
              ),
            Text('О платформе', style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('LMS платформа - Образовательная платформа Астана Хаб предоставляет доступ к разнообразным образовательным программам и курсам в области информационных технологий (IT) и технологического предпринимательства.', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center, ),
            ),
        
            ],
          ),
          const Divider(thickness: 2,),
          Column(
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Актуальные курсы', style: Theme.of(context).textTheme.titleLarge,),
            ),
            CourseCatalogWidget(),
        
            ],
          ),
        
          ],),
        ),
        if (showSurvey == true)
        Positioned(bottom: 50,child: Container(decoration: BoxDecoration(
          boxShadow: const [BoxShadow(
            blurRadius: 20
            
          )],
          borderRadius: BorderRadius.circular(12),
          
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor, 
            Theme.of(context).highlightColor
        ])),
          

        
        
        ),)      
      
      ],
    );
  }
}
