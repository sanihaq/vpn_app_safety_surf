import 'package:flutter/material.dart';

import '../theming/colors.dart';

class AppTab extends StatelessWidget {
  const AppTab({
    super.key,
    required this.icon,
    required this.activeIcon,
    required this.text,
    this.isActive = false,
    this.color,
    this.onTap,
  });

  final IconData icon;
  final IconData activeIcon;
  final String text;
  final Color? color;
  final bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            isActive ? activeIcon : icon,
            color: isActive ? color ?? AppColors.indigo : AppColors.lightStateGray,
          ),
          const SizedBox(height: 4),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isActive ? color ?? AppColors.indigo : AppColors.lightStateGray,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
