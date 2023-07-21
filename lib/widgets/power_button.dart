import 'package:flutter/material.dart';

import '../theming/colors.dart';
import '../utils/app_icons.dart';

class PowerButton extends StatelessWidget {
  const PowerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: ShapeDecoration(
        color: AppColors.yellow,
        shape: OvalBorder(),
      ),
      child: Icon(
        AppIcons.power,
        size: 28,
      ),
    );
  }
}
