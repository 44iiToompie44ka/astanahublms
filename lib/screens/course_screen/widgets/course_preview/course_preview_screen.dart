import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursePreviewScreen extends StatelessWidget{
  final String type;
  final String imgurl;
  final String title;
  final String text;
  const CoursePreviewScreen({super.key, required this.type, required this.imgurl, required this.title, required this.text});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Курс $title")),
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imgurl)),
          ),
          Text(title, style: TextStyle(fontSize: Theme.of(context).textTheme.displaySmall!.fontSize! + 4),),
          Container(decoration: BoxDecoration(border: Border.all(width: 2), borderRadius: BorderRadius.circular(6)), child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(type),
          )),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text('Описание', style: TextStyle(fontSize: 15),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,textAlign: TextAlign.center ,style: TextStyle(fontSize: 14),),
          ),

          const SizedBox(height: 12,),
          GestureDetector(
            onTap:() => _launchUrl('https://education.astanahub.com/betacareer#popup:myformFULLONE'),
            child: Container(
              height: 65, width: MediaQuery.of(context).size.width - 85,
            
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).highlightColor,
            
            ], 
            
              end: Alignment.topLeft,
              begin: Alignment.bottomRight,
            )) ,
            alignment: Alignment.center,
            child: const Text('Записаться', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),),
          )],
      ),
    );
  }
  Future<void> _launchUrl(String url) async {
  Uri _url = Uri.parse(url);

  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }}
}