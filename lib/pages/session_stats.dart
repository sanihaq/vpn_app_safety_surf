import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:intl/intl.dart';
import 'package:vpn_app/data/models/session_model.dart';
import 'package:vpn_app/theming/colors.dart';
import 'package:vpn_app/widgets/bottom_button.dart';

import '../data/models/location_model.dart';
import '../states/notifier.dart';
import '../utils/app_icons.dart';
import '../utils/assets.dart';
import '../utils/sizes.dart';

final _stisFactionRate = ValueNotifier(-1);

class SessionStats extends StatefulWidget {
  const SessionStats({super.key});

  @override
  State<SessionStats> createState() => _SessionStatsState();
}

class _SessionStatsState extends State<SessionStats> {
  @override
  void initState() {
    super.initState();
    _stisFactionRate.value = -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.gradientBg,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Builder(builder: (context) {
                final selectedIP = selectedIPs.reactiveValue(context).first;
                final location = LocationModel.locationByIp(selectedIP);
                final server = location?.serverByIp(selectedIP);

                return Column(
                  children: [
                    Text(
                      'Session stats',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(
                                AppIcons.lockkey,
                                size: 26,
                                color: AppColors.tealBlue,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'IKEv2',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                location?.country.toUpperCase() ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'Antonio',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(
                                width: 131,
                                child: Text(
                                  server?.ip ?? "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                location?.countryFlag ?? "",
                                width: 26,
                              ),
                              SizedBox(height: 6),
                              Text(
                                location?.countryCode ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Builder(builder: (context) {
                        final lastSession = currentSession.reactiveValue(context);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  AppIcons.airplanetakeoff,
                                  size: 26,
                                  color: AppColors.tealBlue,
                                ),
                                Text(
                                  DateFormat.jm().format(lastSession?.startTime ?? DateTime.now()),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'Antonio',
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1,
                                  ),
                                ),
                                Text(
                                  'Start',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  AppIcons.hourglasssimple,
                                  size: 26,
                                  color: AppColors.tealBlue,
                                ),
                                Text(
                                  SessionModel.formatTimeInSeconds(
                                      lastSession?.sessionInSeconds.value ?? 0),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'Antonio',
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1,
                                  ),
                                ),
                                Text(
                                  'Session',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  AppIcons.airplanelanding,
                                  size: 26,
                                  color: AppColors.tealBlue,
                                ),
                                Text(
                                  DateFormat.jm().format(lastSession?.endTime ?? DateTime.now()),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'Antonio',
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1,
                                  ),
                                ),
                                Text(
                                  'End',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ],
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(
                                AppIcons.download,
                                size: 26,
                                color: AppColors.tealBlue,
                              ),
                              Text(
                                '6,8',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'Antonio',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                'MB',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                AppIcons.hourglasssimple,
                                size: 26,
                                color: AppColors.tealBlue,
                              ),
                              Text(
                                server?.name.toUpperCase() ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'Antonio',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                'Server',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                AppIcons.upload,
                                size: 26,
                                color: AppColors.tealBlue,
                              ),
                              Text(
                                '2,1',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'Antonio',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                'MB',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Are you satisfied\nwith the connection?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _stisFactionRate.value = 1;
                          },
                          child: Column(
                            children: [
                              Builder(builder: (context) {
                                return Icon(
                                  _stisFactionRate.reactiveValue(context) == 1
                                      ? AppIcons.thumbsup_fill
                                      : AppIcons.thumbsup,
                                  color: AppColors.white,
                                  size: 24,
                                );
                              }),
                              SizedBox(height: 6),
                              Text(
                                'Good',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (favouriteIPs.value.contains(server?.ip)) {
                              favouriteIPs.value = [...favouriteIPs.value]..remove(server?.ip);
                            } else {
                              if (server != null) {
                                favouriteIPs.value = [...favouriteIPs.value, server.ip];
                              }
                            }
                          },
                          child: Column(
                            children: [
                              Icon(
                                favouriteIPs.reactiveValue(context).contains(server?.ip ?? "")
                                    ? AppIcons.heart_fill
                                    : AppIcons.heart,
                                color: AppColors.white,
                                size: 24,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Favourite',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _stisFactionRate.value = 0;
                          },
                          child: Column(
                            children: [
                              Builder(builder: (context) {
                                return Icon(
                                  _stisFactionRate.reactiveValue(context) == 0
                                      ? AppIcons.thumbsdown_fill
                                      : AppIcons.thumbsdown,
                                  color: AppColors.white,
                                  size: 24,
                                );
                              }),
                              SizedBox(height: 6),
                              Text(
                                'Bad',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: BottomNavigationButton(
                icon: AppIcons.x,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
