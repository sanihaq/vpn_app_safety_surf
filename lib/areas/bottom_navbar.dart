import 'package:flutter/material.dart';

import '../pages/get_pro.dart';
import '../pages/servers_page.dart';
import '../pages/settings_page.dart';
import '../utils/app_icons.dart';
import '../utils/create_route.dart';
import '../widgets/bottom_button.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BottomNavigationButton(
          icon: AppIcons.crown,
          onTap: () {
            Navigator.of(context).push(
              createRoute(const GetProPage()),
            );
          },
        ),
        BottomNavigationButton(
          icon: AppIcons.globesimple,
          onTap: () {
            Navigator.of(context).push(
              createRoute(const ServersPage()),
            );
          },
        ),
        BottomNavigationButton(
          icon: AppIcons.nut,
          onTap: () {
            Navigator.of(context).push(
              createRoute(const SettingsPage()),
            );
          },
        ),
      ],
    );
  }
}
