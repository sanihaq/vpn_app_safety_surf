import 'package:flutter/material.dart';

import '../theming/colors.dart';

class ConnectionHealthIndicator extends StatelessWidget {
  const ConnectionHealthIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            width: 6,
            height: 6,
            decoration: ShapeDecoration(
              shape: OvalBorder(),
              color: AppColors.green,
            ),
          ),
        ),
      ),
    );
  }
}
