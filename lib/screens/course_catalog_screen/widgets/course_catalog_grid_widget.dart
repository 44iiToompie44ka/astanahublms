import 'package:astanahublmss/screens/course_screen/widgets/course_preview/course_preview_screen.dart';
import 'package:flutter/material.dart';

class CourseCatalogWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: 500,
      child: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
      CourseCatalogItem(type: 'Предпренимательство', imgurl: "http://lms-backend.astanahub.com/storage/lesson_templates/2/Facebook%20post%20-%209%20(1)_ku8CPo.png", title: 'Startup School', text: 'this is a text, that says about the course',),
      CourseCatalogItem(type: 'Карьера', imgurl: "http://lms-backend.astanahub.com/storage/lesson_templates/189/Instagram%20post%20-%2020_KnSW88.png", title: 'FlutterFlow', text: 'С помощью FlutterFlow можно создавать красивые и функциональные приложения без необходимости писать много кода. Он предоставляет набор инструментов для создания экранов, управления состояниями, добавления анимаций, подключения баз данных и других функциональных возможностей.',),
      CourseCatalogItem(type: 'Предпренимательство', imgurl: "http://lms-backend.astanahub.com/storage/lesson_templates/172/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202023-02-13%20%D0%B2%2015.49.41_QQa4Nw.png", title: 'Scalerator', text: 'this is a text, that says about the course',),
      CourseCatalogItem(type: 'Карьера', imgurl: "http://lms-backend.astanahub.com/storage/lesson_templates/294/apt4%20(2)_mrWidE.jpg", title: 'Swift Разработка', text: 'this is a text, that says about the course',),
      CourseCatalogItem(type: 'Предпренимательство', imgurl: "http://lms-backend.astanahub.com/storage/lesson_templates/203/startup%20garage_Hc1R4J%20(1)_QACqF3.png", title: 'Startup Garage', text: 'this is a text, that says about the course',),
      CourseCatalogItem(type: 'Предпренимательство', imgurl: "http://lms-backend.astanahub.com/storage/lesson_templates/150/sa%20(1)_UuEpC8.png", title: 'Startup Academy', text: 'this is a text, that says about the course',),
      CourseCatalogItem(type: 'Фриланс', imgurl: "http://lms-backend.astanahub.com/storage/lesson_templates/207/photo_2023-07-27_17-19-07_22H2LL.jpg", title: 'Startup Academy', text: 'this is a text, that says about the course',),

        ],
      ),
    );
  }
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
        height: 250, // Set a fixed height for the container
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
                  height: 110, // Set a fixed height for the image
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
