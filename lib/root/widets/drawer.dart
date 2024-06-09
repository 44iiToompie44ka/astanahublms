import 'package:astanahublmss/root/widets/user_account_mini.dart';
import 'package:flutter/material.dart';
import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends StatelessWidget {
  final ValueChanged<int> onTap;
  final int selectedIndex;

  const MainDrawer({required this.onTap, required this.selectedIndex, super.key});

  void _launchAppStoreUrl() async {
    const appStoreUrl = 'https://apps.apple.com/ru/app/astana-hub/id6462979274';

    if (await canLaunchUrl(appStoreUrl as Uri)) {
      await launchUrl(appStoreUrl as Uri);
    } else {
      throw 'Could not launch $appStoreUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.network(
              "https://edu.astanahub.com/img/logo%20mid.e4719028.png",
              errorBuilder: (context, error, stackTrace) {
    return Image.asset('assets/ui/network_image_error.jpg', width: 80, height: 80 ,); // Path to your error image
  },
              width: 80,
              height: 80,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              selected: selectedIndex == 0,
              leading: const Icon(AkarIcons.home_alt1),
              title: const Text('Каталог курсов'),
              onTap: () => onTap(0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              selected: selectedIndex == 1,
              leading: const Icon(AkarIcons.newspaper),
              title: const Text('Новости'),
              onTap: () => onTap(1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              selected: selectedIndex == 2,
              leading: const Icon(AkarIcons.people_group),
              title: const Text('Astana Hub Meetups'),
              onTap: () => onTap(2),
            ),
          ),
          const Divider(thickness: 2),
          UserAccountMiniWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              selected: selectedIndex == 3,
              leading: const Icon(AkarIcons.gear),
              title: const Text('Настройки'),
              onTap: () => onTap(3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              leading: const Icon(AkarIcons.devices),
              title: const Text('Astana Hub Приложение'),
              onTap: () => _launchAppStoreUrl,
            ),
          ),

        

        
        
        ],
      ),
    );

  }
}
