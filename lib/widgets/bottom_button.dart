import 'package:flutter/material.dart';

import '../theming/colors.dart';

class BottomNavigationButton extends StatelessWidget {
  const BottomNavigationButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  final IconData icon;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 98,
        height: 56,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
        child: Icon(icon, size: 32),
      ),
    );
  }
}
