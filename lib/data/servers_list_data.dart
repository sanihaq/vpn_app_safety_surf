import 'package:vpn_app/data/models/location_model.dart';
import 'package:vpn_app/data/models/server_model.dart';
import 'package:vpn_app/utils/assets.dart';

final serverLocationsList = <LocationModel>[
  LocationModel(
    country: "Austria",
    countryFlag: kFlagAustria,
    servers: [
      ServerModel(name: "au-free#1", ip: "141.69.120.10", isPro: false, isFavourite: false),
      ServerModel(name: "au-free#2", ip: "31.202.171.110", isPro: false, isFavourite: false),
      ServerModel(name: "au-pro#1", ip: "103.168.204.239", isPro: false, isFavourite: false),
    ],
  ),
  LocationModel(
    country: "France",
    countryFlag: kFlagAustria,
    servers: [
      ServerModel(name: "fr-free#1", ip: "153.157.124.113", isPro: false, isFavourite: false),
      ServerModel(name: "fr-free#2", ip: "125.225.114.92", isPro: false, isFavourite: false),
      ServerModel(name: "fr-pro#1", ip: "136.169.12.129", isPro: false, isFavourite: false),
    ],
  ),
  LocationModel(
    country: "Germany",
    countryFlag: kFlagAustria,
    servers: [
      ServerModel(name: "de-free#1", ip: "74.62.225.21", isPro: false, isFavourite: false),
      ServerModel(name: "de-free#2", ip: "210.122.71.182", isPro: false, isFavourite: false),
      ServerModel(name: "de-pro#1", ip: "84.165.53.104", isPro: false, isFavourite: false),
    ],
  ),
  LocationModel(
    country: "Hungary",
    countryFlag: kFlagAustria,
    servers: [
      ServerModel(name: "hu-free#1", ip: "137.124.157.69", isPro: false, isFavourite: false),
      ServerModel(name: "hu-free#2", ip: "181.9.192.146", isPro: false, isFavourite: false),
      ServerModel(name: "hu-pro#1", ip: "141.82.136.159", isPro: false, isFavourite: false),
    ],
  ),
  LocationModel(
    country: "Ireland",
    countryFlag: kFlagAustria,
    servers: [
      ServerModel(name: "ie-free#1", ip: "164.44.147.73", isPro: false, isFavourite: false),
      ServerModel(name: "ie-free#2", ip: "186.215.114.6", isPro: false, isFavourite: false),
      ServerModel(name: "ie-pro#1", ip: "184.226.193.195", isPro: false, isFavourite: false),
    ],
  ),
  LocationModel(
    country: "Italy",
    countryFlag: kFlagAustria,
    servers: [
      ServerModel(name: "it-free#1", ip: "96.134.133.187", isPro: false, isFavourite: false),
      ServerModel(name: "it-free#2", ip: "115.49.12.47", isPro: false, isFavourite: false),
      ServerModel(name: "it-pro#1", ip: "91.228.234.72", isPro: false, isFavourite: false),
    ],
  ),
  LocationModel(
    country: "Luxembourg",
    countryFlag: kFlagAustria,
    servers: [
      ServerModel(name: "lx-free#1", ip: "5.149.112.247", isPro: false, isFavourite: false),
      ServerModel(name: "lx-free#2", ip: "36.125.243.137", isPro: false, isFavourite: false),
      ServerModel(name: "lx-pro#1", ip: "25.231.36.178", isPro: false, isFavourite: false),
    ],
  ),
];
