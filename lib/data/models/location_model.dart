import 'package:vpn_app/data/servers_list_data.dart';

import 'server_model.dart';

class LocationModel {
  LocationModel({
    required this.country,
    required this.countryCode,
    required this.countryFlag,
    required this.servers,
  });

  final String country;
  final String countryCode;
  final String countryFlag;
  final List<ServerModel> servers;

  static LocationModel? locationByIp(String ip) {
    return serverLocationsList.firstWhere((e) => e.servers.any((el) => el.ip == ip));
  }

  ServerModel? serverByIp(String ip) {
    return servers.firstWhere((el) => el.ip == ip);
  }
}
