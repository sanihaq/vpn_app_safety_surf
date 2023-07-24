import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:vpn_app/theming/text_styles.dart';

import '../data/models/location_model.dart';
import '../states/notifiers.dart';
import '../utils/app_icons.dart';
import '../widgets/connection_health_indicator.dart';

class LocationArea extends StatelessWidget {
  const LocationArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selectedIp = selectedIPs.reactiveValue(context).firstOrNull ?? "";
    final location = LocationModel.locationByIp(selectedIp);
    final server = location?.serverByIp(selectedIp);
    Future.delayed(Duration.zero).then((value) => server?.checkPing());
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
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  SizedBox(
                    width: 124,
                    child: Text(
                      location.country.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.antonioLight26Caps.copyWith(
                        color: Theme.of(context).indicatorColor,
                        overflow: TextOverflow.fade,
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
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 98,
                    child: Text(
                      'Auto',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.poppins16Regular.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 124,
                    child: Text(
                      server.ip,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.poppins16Regular.copyWith(
                        color: Theme.of(context).hintColor,
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
                        style: AppTextStyles.poppins16Regular.copyWith(
                          color: Theme.of(context).hintColor,
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
