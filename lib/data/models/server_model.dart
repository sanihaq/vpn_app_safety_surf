import 'package:vpn_app/data/servers_list_data.dart';

import 'location_model.dart';

class ServerModel {
  ServerModel({
    required this.name,
    required this.ip,
    required this.isPro,
    required this.isFavourite,
  });
  final String name;
  final String ip;
  final bool isPro;
  final bool isFavourite;

  LocationModel? get parent {
    return serverLocationsList.firstWhere((e) => e.servers.any((el) => el.ip == ip));
  }
}
