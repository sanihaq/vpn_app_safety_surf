import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../theming/colors.dart';

class OverflowCircle extends StatelessWidget {
  const OverflowCircle({
    super.key,
    required this.size,
    this.paddingOffset = 0,
    this.circleSizes = const [],
  });

  final double size;

  /// only pass if the `OverflowCircle` is in top
  final double paddingOffset;

  final List<double> circleSizes;

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxWidth: size,
      maxHeight: size,
      child: Container(
        height: size - paddingOffset,
        width: size,
        decoration: ShapeDecoration(
          color: Theme.of(context).canvasColor,
          shape: const OvalBorder(),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: circleSizes.mapIndexed(
            (i, size) {
              return Align(
                alignment: paddingOffset != 0 ? Alignment.bottomCenter : Alignment.topCenter,
                child: Transform.translate(
                  offset: paddingOffset != 0 ? Offset(0, size / 2) : Offset(0, -size / 2),
                  child: Container(
                    width: size,
                    height: size,
                    decoration: getCircleDecoration(
                      Theme.of(context).brightness == Brightness.light
                          ? AppColors.white
                          : const Color.fromRGBO(147, 167, 200, 0.2),
                      Theme.of(context).brightness == Brightness.light
                          ? const Color.fromRGBO(124, 133, 141, 0.2)
                          : null,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  BoxDecoration getCircleDecoration(Color color, [Color? borerColor]) {
    LinearGradient linearGradient(Color color) => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0, 0.37, 0.5, 0.63, 1],
          colors: [
            color,
            color.withOpacity(0),
            color.withOpacity(0),
            color.withOpacity(0),
            color,
          ],
        );
    return BoxDecoration(
      border: GradientBoxBorder(gradient: linearGradient(borerColor ?? color), width: 1),
      gradient: linearGradient(color),
      shape: BoxShape.circle,
    );
  }
}
