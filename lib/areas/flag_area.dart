import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../utils/assets.dart';

class FlagArea extends StatelessWidget {
  const FlagArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [k15, k36, k5]
          .mapIndexed(
            (i, el) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Image.asset(
                el,
                width: i == 1 ? 96 : 80,
              ),
            ),
          )
          .toList(),
    );
  }
}
