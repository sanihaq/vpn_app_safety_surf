import 'package:flutter/material.dart';

import '../theming/colors.dart';
import '../utils/app_icons.dart';

class LocationConditionInfo extends StatelessWidget {
  const LocationConditionInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(
            AppIcons.lightning_fill,
            color: AppColors.indigo,
            size: 30,
          ),
        ),
        Text(
          'Optimal location',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF5E5CE6),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
