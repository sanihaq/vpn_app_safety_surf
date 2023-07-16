import 'package:flutter/material.dart';

import '../pages/get_pro.dart';
import '../pages/servers_page.dart';
import '../pages/settings_page.dart';
import '../utils/app_icons.dart';
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
              _createRoute(const GetProPage()),
            );
          },
        ),
        BottomNavigationButton(
          icon: AppIcons.globesimple,
          onTap: () {
            Navigator.of(context).push(
              _createRoute(const ServersPage()),
            );
          },
        ),
        BottomNavigationButton(
          icon: AppIcons.nut,
          onTap: () {
            Navigator.of(context).push(
              _createRoute(const SettingsPage()),
            );
          },
        ),
      ],
    );
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 180),
      reverseTransitionDuration: const Duration(milliseconds: 150),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
