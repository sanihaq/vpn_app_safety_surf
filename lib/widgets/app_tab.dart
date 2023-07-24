import 'package:flutter/material.dart';
import 'package:vpn_app/theming/text_styles.dart';

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
      child: Container(
        width: 90,
        color: Colors.transparent,
        child: Column(
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color:
                  isActive ? color ?? Theme.of(context).primaryColor : Theme.of(context).hintColor,
            ),
            const SizedBox(height: 4),
            Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyles.poppins16Regular.copyWith(
                color: isActive
                    ? color ?? Theme.of(context).primaryColor
                    : Theme.of(context).hintColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
