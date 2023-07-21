import 'package:flutter/material.dart';

import '../theming/colors.dart';

class ConnectionHealthIndicator extends StatelessWidget {
  const ConnectionHealthIndicator({
    super.key,
    required this.health,
  });

  final int health;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        3,
        (i) {
          final isGreen = health <= 90 ? true : false;
          double opacity = i == 0 || isGreen && health <= 50 || !isGreen && health <= 110
              ? 1
              : isGreen && health <= 70 || !isGreen && health <= 150 && i <= 1
                  ? 1
                  : 0.3;
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: 6,
              height: 6,
              decoration: ShapeDecoration(
                shape: const OvalBorder(),
                color: (isGreen ? AppColors.green : AppColors.yellow).withOpacity(opacity),
              ),
            ),
          );
        },
      ),
    );
  }
}
