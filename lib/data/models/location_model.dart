import 'server_model.dart';

class LocationModel {
  LocationModel({
    required this.country,
    required this.countryFlag,
    required this.servers,
  });

  final String country;
  final String countryFlag;
  final List<ServerModel> servers;
}
