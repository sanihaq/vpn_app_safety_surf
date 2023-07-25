import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:vpn_app/data/models/session_model.dart';
import 'package:vpn_app/pages/session_stats.dart';
import 'package:vpn_app/theming/colors.dart';
import 'package:vpn_app/theming/text_styles.dart';

import '../states/notifiers.dart';
import '../utils/create_route.dart';
import 'gradient_text.dart';

Timer? _connectionTimer;

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var text = Text(
      connectionState.reactiveValue(context) == ConnectionState.none
          ? 'START'
          : connectionState.reactiveValue(context) == ConnectionState.waiting
              ? 'STOP'
              : 'OFF',
      textAlign: TextAlign.center,
      style: AppTextStyles.antonioLight26Caps.copyWith(
        color: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).indicatorColor
            : null,
      ),
    );
    return GestureDetector(
      onTap: () {
        if (connectionState.value == ConnectionState.none) {
          connectionState.value = ConnectionState.waiting;
          _connectionTimer?.cancel();
          _connectionTimer = Timer(const Duration(seconds: 1), () {
            connectionState.value = ConnectionState.active;
            currentSession.value = SessionModel(ip: selectedIPs.value.first)..startSession();
          });
        } else {
          _connectionTimer?.cancel();
          final wasActive = connectionState.value == ConnectionState.active;
          connectionState.value = ConnectionState.none;
          currentSession.value?.stopSession();
          if (wasActive) {
            Future.delayed(const Duration(milliseconds: 300)).then((value) {
              Navigator.of(context).push(
                createRoute(const SessionStats()),
              );
            });
          }
        }
      },
      child: Container(
        width: 99,
        height: 99,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          gradient: Theme.of(context).brightness == Brightness.dark &&
                  connectionState.reactiveValue(context) == ConnectionState.none
              ? const LinearGradient(
                  begin: Alignment(-0.08, 1.00),
                  end: Alignment(0.08, -1),
                  colors: [AppColors.indigo, AppColors.tealBlue],
                )
              : null,
          border: GradientBoxBorder(
            width: 3,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: Theme.of(context).brightness == Brightness.dark
                  ? const [
                      Color.fromRGBO(33, 45, 64, 0),
                      Color.fromRGBO(33, 45, 64, 0.3),
                    ]
                  : const [
                      Color.fromRGBO(243, 245, 247, 0),
                      Color.fromRGBO(243, 245, 247, 1),
                    ],
            ),
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0x3D000000)
                  : const Color(0x14000000),
              blurRadius: 24,
              offset: const Offset(0, 16),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child:
              Theme.of(context).brightness == Brightness.dark ? text : GradientWidget(child: text),
        ),
      ),
    );
  }
}
