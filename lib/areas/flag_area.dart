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
      children: [kFlagFrance, kFlagLuxembourg, kFlagGermany]
          .mapIndexed(
            (i, el) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Image.asset(
                el,
                width: i == 1 ? 65 : 45,
              ),
            ),
          )
          .toList(),
    );
  }
}
