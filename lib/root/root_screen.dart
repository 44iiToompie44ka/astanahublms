

import 'package:astanahublmss/root/widets/drawer.dart';
import 'package:astanahublmss/screens/course_catalog_screen/course_catalog_screen.dart';
import 'package:astanahublmss/screens/meet_up_screen/meet_up_screen.dart';
import 'package:astanahublmss/screens/news_screen/news_screen.dart';
import 'package:astanahublmss/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  @override
  void initState(){
    super.initState();

  }

  static final List<Widget> _widgetOptions = <Widget>[
    const CourseCatalogScreen(),
    const NewsScreen(),
    const MeetupsScreen(),
    SettingsScreen(),
    SettingsScreen(),
    SettingsScreen(),
    SettingsScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Image.asset('assets/logoAppBar.png'),
      ),
      drawer: MainDrawer(
        onTap: (index) {
          _onItemTapped(index);
          Navigator.pop(context); 
        },
        selectedIndex: _selectedIndex,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
    );
  }
}