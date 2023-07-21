import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:vpn_app/data/models/location_model.dart';
import 'package:vpn_app/states/notifier.dart';

import '../utils/assets.dart';

class FlagArea extends StatelessWidget {
  const FlagArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: selectedIPs.reactiveValue(context).mapIndexed(
        (i, el) {
          final location = LocationModel.locationByIp(el);
          // final server = location?.serverByIp(el);
          return location == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Image.asset(
                    location.countryFlag,
                    width: i == 1 ? 65 : 45,
                  ),
                );
        },
      ).toList(),
    );
  }
}
