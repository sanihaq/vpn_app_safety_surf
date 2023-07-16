import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';

import '../states/notifier.dart';
import '../theming/colors.dart';
import '../utils/app_icons.dart';

class LocationConditionInfo extends StatelessWidget {
  const LocationConditionInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return connectionState.reactiveValue(context) == ConnectionState.none
        ? Column(
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
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  connectionState.reactiveValue(context) == ConnectionState.waiting
                      ? AppIcons.spinner
                      : AppIcons.hourglasssimple,
                  size: 28,
                  color: AppColors.indigo,
                ),
              ),
              Text(
                connectionState.reactiveValue(context) == ConnectionState.waiting
                    ? 'CONNECTION'
                    : '00:17:32',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.indigo,
                  fontSize: 24,
                  fontFamily: 'Antonio',
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                connectionState.reactiveValue(context) == ConnectionState.waiting
                    ? 'Assigning IP'
                    : 'Session',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.lightStateGray,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          );
  }
}
