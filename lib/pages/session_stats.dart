import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:vpn_app/theming/colors.dart';
import 'package:vpn_app/widgets/bottom_button.dart';

import '../utils/app_icons.dart';
import '../utils/assets.dart';
import '../utils/sizes.dart';

class SessionStats extends StatelessWidget {
  const SessionStats({super.key});

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
              child: Column(
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
                              'AUSTRIA',
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
                                '5.181.231.255',
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
                              kFlagAustria,
                              width: 26,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'AU',
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
                    child: Row(
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
                              '03:15 PM',
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
                              '03:15:21',
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
                              '06:30 PM',
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
                              'AU-pro#2',
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
                      Column(
                        children: [
                          Icon(
                            AppIcons.thumbsup_fill,
                            color: AppColors.white,
                            size: 24,
                          ),
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
                      Column(
                        children: [
                          Icon(
                            AppIcons.heart,
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
                      Column(
                        children: [
                          Icon(
                            AppIcons.thumbsdown,
                            color: AppColors.white,
                            size: 24,
                          ),
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
                    ],
                  )
                ],
              ),
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
