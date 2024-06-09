import 'package:astanahublmss/screens/survey_screen/survey_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:akar_icons_flutter/akar_icons_flutter.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
      ),
      body: ListView(
        children: <Widget>[
          SettingsItem(
            icon: AkarIcons.question,
            title: 'Survey',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => SurveyMainScreen()));
            },
          ),
          SettingsItem(
            icon: AkarIcons.sign_out,
            title: 'Sign Out',
            onTap: () {
              // Handle tap
            },
          ),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  SettingsItem({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(title),
      trailing: Icon(
        Icons.chevron_right,
        color: Theme.of(context).primaryColor,
      ),
      onTap: onTap,
    );
  }
}
