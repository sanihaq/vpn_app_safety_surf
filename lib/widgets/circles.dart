import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../states/notifiers.dart';
import '../theming/colors.dart';
import '../utils/sizes.dart';
import 'blend_mask.dart';

class Circles extends StatelessWidget {
  const Circles({
    super.key,
    required this.circleSizes,
    required this.circleSizes2,
  });

  final List<double> circleSizes;
  final List<double> circleSizes2;

  @override
  Widget build(BuildContext context) {
    final connection = connectionState.reactiveValue(context);

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: AppColors.gradientBg,
          ),
        ),
        if (connection == ConnectionState.none)
          BlendMask(
            blendMode: BlendMode.overlay,
            child: Padding(
              padding: const EdgeInsets.only(bottom: kBottomPadding),
              child: Stack(
                children: circleSizes
                    .mapIndexed(
                      (i, e) => Center(
                        child: Container(
                          width: e,
                          height: e,
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.10 * (i + 1)),
                            shape: const OvalBorder(),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        else if (connection == ConnectionState.waiting)
          Stack(
            children: [
              BlendMask(
                blendMode: BlendMode.overlay,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: kBottomPadding),
                  child: Stack(
                    children: circleSizes2
                        .mapIndexed(
                          (i, e) => OverflowBox(
                            maxWidth: e + 10,
                            maxHeight: e + 10,
                            child: Center(
                              child: Container(
                                width: e,
                                height: e,
                                decoration: ShapeDecoration(
                                  color: Colors.white.withOpacity(0.10 * (i + 1)),
                                  shape: const OvalBorder(),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: kBottomPadding),
                child: Stack(
                  children: circleSizes2.mapIndexed(
                    (i, e) {
                      return Center(
                        child: Container(
                          width: i <= 1 ? e * 0.7793 : circleSizes.last,
                          height: i <= 1 ? e * 0.7793 : circleSizes.last,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 0.6,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          )
        else if (connection == ConnectionState.active)
          Padding(
            padding: const EdgeInsets.only(bottom: kBottomPadding),
            child: Stack(
              children: [
                Center(
                  child: Opacity(
                    opacity: 0.10,
                    child: Container(
                      width: circleSizes.last * 1.18,
                      height: circleSizes.last * 1.18,
                      decoration: const ShapeDecoration(
                        color: AppColors.white,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: circleSizes.last,
                    height: circleSizes.last,
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
              ],
            ),
          ),
      ],
    );
  }
}
