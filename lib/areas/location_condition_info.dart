import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:vpn_app/data/models/session_model.dart';
import 'package:vpn_app/theming/text_styles.dart';

import '../states/notifiers.dart';
import '../utils/app_icons.dart';
import '../widgets/spinner_widget.dart';

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
                  AppIcons.lightningFill,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                ),
              ),
              Text(
                'Optimal location',
                textAlign: TextAlign.center,
                style: AppTextStyles.poppins16Regular.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: connectionState.reactiveValue(context) == ConnectionState.waiting
                    ? const SpinnerWidget()
                    : Icon(
                        AppIcons.hourglassSimple,
                        size: 28,
                        color: Theme.of(context).primaryColor,
                      ),
              ),
              Builder(
                builder: (context) {
                  return Text(
                    connectionState.reactiveValue(context) == ConnectionState.waiting
                        ? 'CONNECTION'
                        : currentSession.value == null
                            ? "Error!"
                            : SessionModel.formatTimeInSeconds(
                                currentSession.value!.sessionInSeconds.reactiveValue(context)),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.antonioLight26Caps.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                },
              ),
              const SizedBox(height: 4),
              Text(
                connectionState.reactiveValue(context) == ConnectionState.waiting
                    ? 'Assigning IP'
                    : 'Session',
                textAlign: TextAlign.center,
                style: AppTextStyles.poppins16Regular.copyWith(
                  color: Theme.of(context).hintColor,
                ),
              ),
            ],
          );
  }
}
