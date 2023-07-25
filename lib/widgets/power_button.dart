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
  const PowerButton({super.key, this.onTap, required this.type, this.iconData = AppIcons.power});

  final void Function()? onTap;
  final PowerButtonType type;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final gradientColor = type == PowerButtonType.blue
        ? const LinearGradient(
            begin: Alignment(-0.71, -0.71),
            end: Alignment(0.71, 0.71),
            colors: [AppColors.tealBlue, AppColors.indigo],
          )
        : null;
    final color = type == PowerButtonType.yellow
        ? AppColors.yellow
        : type == PowerButtonType.dark
            ? AppColors.charcoal
            : type == PowerButtonType.white
                ? AppColors.white
                : AppColors.white;
    final wrapperColor = type == PowerButtonType.yellow
        ? AppColors.yellow
        : type == PowerButtonType.blue
            ? AppColors.tealBlue
            : type == PowerButtonType.dark
                ? AppColors.prussianBlue
                : type == PowerButtonType.white && iconData != AppIcons.crown
                    ? AppColors.lightStateGray
                    : AppColors.white;
    final double wrapperOpacity1 = type == PowerButtonType.yellow
        ? 0.6
        : type == PowerButtonType.blue
            ? 1
            : type == PowerButtonType.dark
                ? 1
                : type == PowerButtonType.white && iconData != AppIcons.crown
                    ? 0.18
                    : 0.6;
    final double wrapperOpacity2 = type == PowerButtonType.yellow
        ? 0.22
        : type == PowerButtonType.blue
            ? 0.3
            : type == PowerButtonType.dark
                ? 0.6
                : type == PowerButtonType.white && iconData != AppIcons.crown
                    ? 0.1
                    : 0.22;
    final isGradientIcon = (type == PowerButtonType.white && iconData != AppIcons.crown) ||
            type == PowerButtonType.dark
        ? true
        : false;
    final iconColor = !isGradientIcon
        ? type == PowerButtonType.blue
            ? AppColors.white
            : AppColors.black
        : null;
    final borderGradientColor = type == PowerButtonType.yellow
        ? [
            AppColors.pink.withOpacity(0),
            AppColors.pink.withOpacity(0.1),
          ]
        : type == PowerButtonType.blue
            ? [
                AppColors.tealBlue.withOpacity(0),
                AppColors.indigo,
              ]
            : type == PowerButtonType.dark
                ? [
                    AppColors.prussianBlue.withOpacity(0),
                    AppColors.prussianBlue.withOpacity(0.8),
                  ]
                : type == PowerButtonType.white
                    ? [
                        AppColors.bg.withOpacity(0),
                        AppColors.bg.withOpacity(1),
                      ]
                    : [Colors.transparent, Colors.transparent];
    final icon = Icon(
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
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: gradientColor == null ? color : null,
              gradient: gradientColor,
              shape: BoxShape.circle,
              border: GradientBoxBorder(
                width: 3,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: type == PowerButtonType.dark ? [0.18, 0.78] : null,
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
