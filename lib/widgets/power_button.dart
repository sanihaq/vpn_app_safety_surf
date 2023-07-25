import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:vpn_app/widgets/gradient_text.dart';

import '../theming/colors.dart';
import '../utils/app_icons.dart';

enum PowerButtonType {
  white,
  dark,
  yellow,
  blue,
}

class PowerButton extends StatelessWidget {
  const PowerButton({
    super.key,
    this.onTap,
    this.type = PowerButtonType.yellow,
    this.iconData = AppIcons.power,
  });

  final void Function()? onTap;
  final PowerButtonType type;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final color = type == PowerButtonType.yellow
        ? AppColors.yellow
        : type == PowerButtonType.white
            ? AppColors.white
            : AppColors.white;
    final wrapperColor = type == PowerButtonType.yellow
        ? AppColors.yellow
        : type == PowerButtonType.white
            ? AppColors.lightStateGray
            : AppColors.white;
    final double wrapperOpacity1 = type == PowerButtonType.yellow
        ? 0.6
        : type == PowerButtonType.white
            ? 0.18
            : 0;
    final double wrapperOpacity2 = type == PowerButtonType.yellow
        ? 0.22
        : type == PowerButtonType.white
            ? 0.1
            : 0;
    final isGradientIcon = type == PowerButtonType.white ? true : false;
    final iconColor = !isGradientIcon ? AppColors.black : null;
    final borderGradientColor = type == PowerButtonType.yellow
        ? [
            AppColors.pink.withOpacity(0),
            AppColors.pink.withOpacity(0.1),
          ]
        : type == PowerButtonType.white
            ? [
                AppColors.bg.withOpacity(0),
                AppColors.bg.withOpacity(1),
              ]
            : [Colors.transparent, Colors.transparent];
    var icon = Icon(
      iconData,
      size: 30,
      color: iconColor,
    );
    return GestureDetector(
      onTap: onTap,
      child: _WrapperBorder(
        color: wrapperColor,
        opacity: wrapperOpacity2,
        child: _WrapperBorder(
          color: wrapperColor,
          opacity: wrapperOpacity1,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: GradientBoxBorder(
                width: 3,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: borderGradientColor,
                ),
              ),
            ),
            child: isGradientIcon ? GradientWidget(child: icon) : icon,
          ),
        ),
      ),
    );
  }
}

class _WrapperBorder extends StatelessWidget {
  const _WrapperBorder({
    super.key,
    required this.color,
    required this.child,
    required this.opacity,
  });

  final Color color;
  final Widget child;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: GradientBoxBorder(
          width: 1,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0, 0.4, 0.5, 0.6, 1],
            colors: [
              color.withOpacity(opacity),
              color.withOpacity(0),
              color.withOpacity(0),
              color.withOpacity(0),
              color.withOpacity(opacity),
            ],
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: child,
      ),
    );
  }
}
