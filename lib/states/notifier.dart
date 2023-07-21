import 'package:flutter/material.dart';

final connectionState = ValueNotifier<ConnectionState>(ConnectionState.none);

final favouriteIPs = ValueNotifier<List<String>>(["5.149.112.247"]);
