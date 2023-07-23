import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:vpn_app/theming/text_styles.dart';

import '../data/models/location_model.dart';
import '../states/notifier.dart';
import '../theming/colors.dart';
import '../utils/app_icons.dart';
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
    server?.checkPing();
    return location == null || server == null
        ? const SizedBox()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
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
                      style: AppTextStyles.antonioLight26Caps.copyWith(
                        color: AppColors.black,
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
                        color: AppColors.lightStateGray,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 124,
                    child: Text(
                      server.ip,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.poppins16Regular.copyWith(
                        color: AppColors.lightStateGray,
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
                          color: AppColors.lightStateGray,
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
