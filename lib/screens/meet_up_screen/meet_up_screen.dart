import 'package:astanahublmss/screens/meet_up_screen/widgets/meetups_grid_widget.dart';
import 'package:flutter/material.dart';

class MeetupsScreen extends StatelessWidget {
  const MeetupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meetups"),),
      primary: false,
      body: Column(
        
        children:
        [
          MeetupsGridWidget()
        ],
    ));
  }
}
