import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:vpn_app/theming/colors.dart';
import 'package:vpn_app/widgets/bottom_button.dart';

import '../utils/app_icons.dart';
import '../utils/assets.dart';
import '../utils/sizes.dart';
import '../widgets/power_button.dart';

class GetProPage extends StatelessWidget {
  const GetProPage({super.key});

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
            Column(
              children: [
                const SizedBox(height: 60),
                Image.asset(
                  kSurfIconPlain,
                  width: kSizesSurfLogo,
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'PRO',
                        style: TextStyle(
                          color: Color(0xFF64D2FF),
                          fontSize: 24,
                          fontFamily: 'Antonio',
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1,
                        ),
                      ),
                      TextSpan(
                        text: ' SAFETY SURF',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Antonio',
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <IconData, Map<String, String>>{
                      AppIcons.rocketlaunch: {
                        "title": "Unlimited",
                        "subtitle": "speed",
                      },
                      AppIcons.devicemobile: {
                        "title": "Connect 5",
                        "subtitle": "devices",
                      },
                      AppIcons.harddrives: {
                        "title": "1500+",
                        "subtitle": "servers",
                      },
                    }
                        .entries
                        .map((e) => Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Icon(
                                    e.key,
                                    size: 28,
                                    color: AppColors.tealBlue,
                                  ),
                                ),
                                Text(
                                  e.value["title"]!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  e.value["subtitle"]!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 10),
                          spreadRadius: 1,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <String, Map<String, String>>{
                        kEmojiSalut: {
                          "title": "FREE TRIAL",
                          "subtitle": "Unlim / 7 days",
                        },
                        kEmojiShaka: {
                          "title": "MONTHLY",
                          "subtitle": "9.99 \$ / month",
                        },
                        kEmojiSurfer: {
                          "title": "YEARLY",
                          "subtitle": "59.99 \$ / year",
                        },
                      }
                          .entries
                          .mapIndexed(
                            (i, e) => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Image.asset(
                                              e.key,
                                              width: 32,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  e.value["title"]!,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 21,
                                                    fontFamily: 'Antonio',
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  e.value["subtitle"]!,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: AppColors.lightStateGray,
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 12.0),
                                        child: PowerButton(),
                                      ),
                                    ],
                                  ),
                                ),
                                if (i < 2) const Divider(thickness: 2, color: AppColors.bg),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                const Column(
                  children: [
                    Icon(
                      AppIcons.shoppingcartsimple,
                      size: 32,
                      color: AppColors.white,
                    ),
                    Text(
                      'Restore purchases',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
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
