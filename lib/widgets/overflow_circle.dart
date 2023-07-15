import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../theming/colors.dart';

class OverflowCircle extends StatelessWidget {
  const OverflowCircle({
    super.key,
    required this.size,
    this.paddonfOffset = 0,
    this.littleCirlceSizes = const [],
  });

  final double size;

  /// only pass if the `OverflowCircle` is in top
  final double paddonfOffset;

  final List<double> littleCirlceSizes;

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxWidth: size,
      maxHeight: size,
      child: Container(
        height: size - paddonfOffset,
        width: size,
        decoration: const ShapeDecoration(
          color: AppColors.bg,
          shape: OvalBorder(),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: littleCirlceSizes.mapIndexed(
            (i, size) {
              const innerBorder = 1.5;
              return Align(
                alignment: paddonfOffset != 0
                    ? Alignment.bottomCenter
                    : Alignment.topCenter,
                child: Transform.translate(
                  offset: paddonfOffset != 0
                      ? Offset(0, size / 2)
                      : Offset(0, -size / 2),
                  child: Stack(
                    children: [
                      Container(
                        width: size,
                        height: size,
                        decoration:
                            getCircleDecoration(const Color(0xFF7C858D)),
                      ),
                      Transform.translate(
                        offset: const Offset(innerBorder / 2, innerBorder / 2),
                        child: Container(
                          width: size - innerBorder,
                          height: size - innerBorder,
                          decoration: const ShapeDecoration(
                            color: AppColors.white,
                            shape: OvalBorder(),
                          ),
                          // decoration: getCircleDecoration(AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  ShapeDecoration getCircleDecoration(Color color) {
    return ShapeDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // stops: const [1, 0.1, 0, 0.1, 1],
        colors: [
          color.withOpacity(0.2),
          color.withOpacity(0),
          color.withOpacity(0),
          color.withOpacity(0),
          color.withOpacity(0.2),
        ],
      ),
      shape: const OvalBorder(),
    );
  }
}
