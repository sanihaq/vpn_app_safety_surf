import 'package:flutter/material.dart';

final connectionState = ValueNotifier<ConnectionState>(ConnectionState.none);

final favouriteIPs = ValueNotifier<List<String>>(["5.149.112.247"]);

final selectedIPs =
    ValueNotifier<List<String>>(["5.149.112.247", "153.157.124.113", "74.62.225.21"]);
