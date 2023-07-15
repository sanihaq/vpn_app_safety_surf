import 'package:flutter/material.dart';

import '../utils/app_icons.dart';
import '../widgets/bototm_button.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BototmNavigationButton(
          icon: AppIcons.crown,
          onTap: () {},
        ),
        BototmNavigationButton(
          icon: AppIcons.globesimple,
          onTap: () {},
        ),
        BototmNavigationButton(
          icon: AppIcons.nut,
          onTap: () {},
        ),
      ],
    );
  }
}
