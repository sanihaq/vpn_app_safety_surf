import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';

import '../data/models/location_model.dart';
import '../states/notifier.dart';
import '../theming/colors.dart';
import '../utils/app_icons.dart';
import '../utils/assets.dart';
import '../widgets/connection_health_indicator.dart';

class LocatonArea extends StatelessWidget {
  const LocatonArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selectedIp = selectedIPs.reactiveValue(context).firstOrNull ?? "";
    final location = LocationModel.locationByIp(selectedIp);
    final server = location?.serverByIp(selectedIp);
    server?.checkPing(notify: false);
    return location == null || server == null
        ? const SizedBox()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 98,
                    child: Icon(
                      AppIcons.lockkeyopen,
                      size: 30,
                      color: AppColors.lightStateGray,
                    ),
                  ),
                  SizedBox(
                    width: 124,
                    child: Text(
                      location.country.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.black,
                        overflow: TextOverflow.fade,
                        fontSize: 26,
                        fontFamily: 'Antonio',
                        fontWeight: FontWeight.w300,
                        // height: 32,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 98,
                    child: Center(
                      child: Builder(builder: (context) {
                        final ping = server.ping.reactiveValue(context);
                        return ConnectionHealthIndicator(health: ping);
                      }),
                    ),
                  )
                ],
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 98,
                    child: Text(
                      'Auto',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.lightStateGray,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 124,
                    child: Text(
                      server.ip,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF7C858D),
                        overflow: TextOverflow.fade,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 98,
                    child: Builder(builder: (context) {
                      final ping = server.ping.reactiveValue(context);
                      return Text(
                        "$ping ms",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF7C858D),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          );
  }
}
