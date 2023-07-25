import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../states/notifiers.dart';
import '../theming/colors.dart';

class Circles extends StatelessWidget {
  const Circles({
    super.key,
    required this.size,
    required this.sizes,
  });

  final double size;
  final List<double> sizes;

  @override
  Widget build(BuildContext context) {
    final circles = connectionState.reactiveValue(context) == ConnectionState.none
        ? sizes
        : [
            size * 0.555,
            size * 0.3968,
            size * 0.275,
          ];
    return Stack(
      children: connectionState.reactiveValue(context) == ConnectionState.active
          ? [
              Center(
                child: Opacity(
                  opacity: 0.10,
                  child: Container(
                    width: sizes.last * 1.18,
                    height: sizes.last * 1.18,
                    decoration: const ShapeDecoration(
                      color: AppColors.white,
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: sizes.last,
                  height: sizes.last,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0, 0.4, 0.5, 0.6, 1],
                        colors: [
                          AppColors.white.withOpacity(0.2),
                          AppColors.white.withOpacity(0),
                          AppColors.white.withOpacity(0),
                          AppColors.white.withOpacity(0),
                          AppColors.white.withOpacity(0.2)
                        ],
                      ),
                      shape: BoxShape.circle,
                      border: GradientBoxBorder(
                        width: 1,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0, 0.4, 0.5, 0.6, 1],
                          colors: [
                            AppColors.white.withOpacity(0.3),
                            AppColors.white.withOpacity(0),
                            AppColors.white.withOpacity(0),
                            AppColors.white.withOpacity(0),
                            AppColors.white.withOpacity(0.3)
                          ],
                        ),
                      )),
                ),
              ),
            ]
          : circles
              .mapIndexed(
                (i, size) => Center(
                  child: OverflowBox(
                    maxWidth: size,
                    maxHeight: size,
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.10 * (i + 1),
                          child: Container(
                            width: size,
                            height: size,
                            decoration: const ShapeDecoration(
                              color: AppColors.white,
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        if (connectionState.reactiveValue(context) == ConnectionState.waiting)
                          Center(
                            child: Container(
                              width: i <= 1 ? size * 0.78 : sizes.last,
                              height: i <= 1 ? size * 0.78 : sizes.last,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 0.4,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }
}
