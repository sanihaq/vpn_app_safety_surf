import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vpn_app/data/servers_list_data.dart';

import 'location_model.dart';

class ServerModel extends ChangeNotifier {
  ServerModel({
    required this.name,
    required this.ip,
    required this.isPro,
  });
  final String name;
  final String ip;
  final bool isPro;

  final ValueNotifier<int> ping = ValueNotifier(0);

  LocationModel? get parent {
    return serverLocationsList.firstWhere((e) => e.servers.any((el) => el.ip == ip));
  }

  void checkPing({required bool notify}) {
    final random = Random();
    const min = 10;
    ping.value = min + random.nextInt(isPro ? 90 : 180 - min);
    if (notify) ping.notifyListeners();
  }
}
