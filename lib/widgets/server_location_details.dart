import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';

import '../data/models/server_model.dart';
import '../theming/colors.dart';
import '../utils/app_icons.dart';
import 'connection_health_indicator.dart';
import 'power_button.dart';

class ServerLocationDetails extends StatefulWidget {
  const ServerLocationDetails({
    super.key,
    required this.server,
    required this.showIfOptimal,
  });

  final ServerModel server;
  final bool showIfOptimal;

  @override
  State<ServerLocationDetails> createState() => _ServerLocationDetailsState();
}

class _ServerLocationDetailsState extends State<ServerLocationDetails> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    widget.server.checkPing(notify: false);
    // timer = Timer.periodic(
    //   const Duration(seconds: 10),
    //   (Timer t) => widget.server.checkPing(notify: true),
    // );
  }

  @override
  void dispose() {
    widget.server.ping.removeListener(() {});
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.showIfOptimal && widget.server.ping.value > 90
        ? const SizedBox()
        : Column(
            children: [
              Divider(
                color: AppColors.bg,
                thickness: 2,
                height: 0,
                indent: 0,
                endIndent: 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ConnectionHealthIndicator(health: widget.server.ping.value),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                widget.server.name.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Antonio',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                              child: Icon(
                                AppIcons.lightning_fill,
                                size: 18,
                                color: AppColors.indigo,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Builder(builder: (context) {
                                final ping = widget.server.ping.value; //reactiveValue(context);
                                return Text(
                                  'Ping: $ping ms',
                                  style: TextStyle(
                                    color: Color(0xFF7C858D),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                              }),
                            )
                          ],
                        ),
                      ],
                    ),
                    PowerButton()
                  ],
                ),
              ),
            ],
          );
  }
}
