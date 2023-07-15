import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../theming/colors.dart';

class Circles extends StatelessWidget {
  const Circles({
    super.key,
    required this.sizes,
  });

  final List<double> sizes;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: sizes
          .mapIndexed(
            (i, size) => Center(
              child: Opacity(
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
            ),
          )
          .toList(),
    );
  }
}
