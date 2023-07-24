import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:vpn_app/states/notifiers.dart';

import '../data/models/server_model.dart';
import '../theming/colors.dart';
import '../theming/text_styles.dart';
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
    Future.delayed(Duration.zero).then((value) => widget.server.checkPing());
    // timer = Timer.periodic(
    //   const Duration(seconds: 10),
    //   (Timer t) => widget.server.checkPing(),
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
                color: Theme.of(context).canvasColor,
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
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: ConnectionHealthIndicator(health: widget.server.ping.value),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                widget.server.name.toUpperCase(),
                                style: AppTextStyles.antonioLight21Caps.copyWith(
                                  color: Theme.of(context).indicatorColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Builder(builder: (context) {
                                  final isFavorite =
                                      favoriteIPs.reactiveValue(context).contains(widget.server.ip);
                                  final isLowPing = widget.server.ping.value < 90;
                                  return Icon(
                                    isFavorite
                                        ? AppIcons.heart_fill
                                        : isLowPing
                                            ? AppIcons.lightning_fill
                                            : AppIcons.globesimple,
                                    size: 18,
                                    color: isFavorite
                                        ? AppColors.pink
                                        : Theme.of(context).primaryColor,
                                  );
                                }),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0, top: 4),
                              child: Builder(builder: (context) {
                                final ping = widget.server.ping.value; //reactiveValue(context);
                                return Text('Ping: $ping ms',
                                    style: AppTextStyles.poppins16Regular
                                        .copyWith(color: Theme.of(context).hintColor));
                              }),
                            )
                          ],
                        ),
                      ],
                    ),
                    PowerButton(
                      onTap: () {
                        selectedIPs.value = [widget.server.ip, ...selectedIPs.value..removeLast()];
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            ],
          );
  }
}
