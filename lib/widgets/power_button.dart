import 'package:flutter/material.dart';

import '../theming/colors.dart';
import '../utils/app_icons.dart';

class PowerButton extends StatelessWidget {
  const PowerButton({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
