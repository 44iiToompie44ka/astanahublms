import 'package:astanahublmss/screens/course_screen/widgets/course_preview/course_preview_screen.dart';
import 'package:flutter/material.dart';

String getSpeechBubbleText(int index) {
  switch (index) {
    case 0:
      return "Какие курсы вас интересуют больше всего?";
    case 1:
      return "Какой у вас уровень опыта в IT?";
    case 2:
      return "Какие форматы обучения вы предпочитаете?";
    case 3:
      return "Как часто вы готовы заниматься обучением?";
    case 4:
      return "Какие временные интервалы для вас наиболее удобны для занятий?";
    case 5:
      return "Какие функции или особенности приложения вы считаете наиболее полезными?";
    case 6:
      return "Как вы узнали о нашем приложении?";
    default:
      return "Спасибо за участие в опросе!";
  }

}

List<Widget> getCourseSuggestions(List<String> selectedOptions) {
  List<Widget> suggestions = [];

  for (var option in selectedOptions) {
    switch (option) {
      case 'Веб-разработка':
        suggestions.add(CourseCatalogItem(
          type: 'Карьера', imgurl: 'http://lms-backend.astanahub.com/storage/lesson_templates/189/Instagram%20post%20-%2020_KnSW88.png', title: 'FlutterFlow', text: 'С помощью FlutterFlow можно создавать красивые и функциональные приложения без необходимости писать много кода. Он предоставляет набор инструментов для создания экранов, управления состояниями, добавления анимаций, подключения баз данных и других функциональных возможностей.',
        ));
        break;
      case 'Мобильная разработка':
        suggestions.add(CourseCatalogItem(
          type: 'Фриланс', imgurl: 'http://lms-backend.astanahub.com/storage/lesson_templates/189/Instagram%20post%20-%2020_KnSW88.png', title: 'FlutterFlow', text: 'С помощью FlutterFlow можно создавать красивые и функциональные приложения без необходимости писать много кода. Он предоставляет набор инструментов для создания экранов, управления состояниями, добавления анимаций, подключения баз данных и других функциональных возможностей.',
        ));
        suggestions.add(CourseCatalogItem(
          type: 'Карьера', imgurl: 'http://lms-backend.astanahub.com/storage/lesson_templates/294/apt4%20(2)_mrWidE.jpg', title: 'Курс Swift', text: '.',
        ));
        break;
      case 'Кибербезопасность':
        suggestions.add(CourseCatalogItem(
          type: 'Карьера', imgurl: 'http://lms-backend.astanahub.com/storage/lesson_templates/251/no%20code%20empt%20(3)_1Ys5sS.png', title: 'Базовая компьютерная \nграмотность', text: 'Онлайн-курс состоит из 10 уроков. Дает базовый набор знаний и навыков работы на компьютере, использования средств вычислительной техники и понимания основ информатики.',
        ));
        break;
      default:
        
    }
  }

  return suggestions;
}


class CourseCatalogItem extends StatelessWidget {
  final String type;
  final String imgurl;
  final String title;
  final String text;

  CourseCatalogItem({
    required this.type,
    required this.imgurl,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).highlightColor,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  imgurl,
                  fit: BoxFit.cover,
                  width: 200,
                  height: 86.5, // Set a fixed height for the image
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black38,
                ),
                Positioned(
                  left: 15,
                  top: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        type,
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 40,
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CoursePreviewScreen(type: type, imgurl: imgurl, title: title, text: text))),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.5),
                        child: Text(
                          'Подробнее',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
