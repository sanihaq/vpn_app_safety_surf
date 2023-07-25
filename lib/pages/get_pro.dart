import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:vpn_app/theming/colors.dart';
import 'package:vpn_app/theming/text_styles.dart';
import 'package:vpn_app/widgets/bottom_button.dart';
import 'package:vpn_app/widgets/gradient_text.dart';

import '../utils/app_icons.dart';
import '../utils/assets.dart';
import '../utils/sizes.dart';
import '../widgets/power_button.dart';

class GetProPage extends StatelessWidget {
  const GetProPage({super.key});

  @override
  Widget build(BuildContext context) {
    var text = Text(
      'SAFETY SURF',
      style: AppTextStyles.antonioLight26Caps.copyWith(
        color: AppColors.white,
      ),
    );
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).canvasColor
              : null,
          gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientBg : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 60),
                Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? kSurfIconGradient
                      : kSurfIconPlain,
                  width: kSizesSurfLogo,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'PRO ',
                      style: AppTextStyles.antonioLight26Caps.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.white
                            : AppColors.tealBlue,
                      ),
                    ),
                    Theme.of(context).brightness == Brightness.dark
                        ? GradientWidget(child: text)
                        : text,
                  ],
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
                                  style: AppTextStyles.poppins16SemiBold
                                      .copyWith(color: AppColors.white),
                                ),
                                Text(
                                  e.value["subtitle"]!,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.poppins16Regular
                                      .copyWith(color: AppColors.white),
                                )
                              ],
                            ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      boxShadow: const [
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
                                                  style: AppTextStyles.antonioLight21Caps.copyWith(
                                                    color: Theme.of(context).indicatorColor,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  e.value["subtitle"]!,
                                                  textAlign: TextAlign.start,
                                                  style: AppTextStyles.poppins16Regular.copyWith(
                                                    color: Theme.of(context).hintColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 12.0),
                                        child: PowerButton(
                                          type: i == 0
                                              ? PowerButtonType.yellow
                                              : PowerButtonType.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (i < 2)
                                  Divider(thickness: 2, color: Theme.of(context).canvasColor),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Column(
                  children: [
                    Icon(
                      AppIcons.shoppingCartSimple,
                      size: 32,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.wildBlueYonder
                          : AppColors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Restore purchases',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.poppins16Regular.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.wildBlueYonder
                              : AppColors.white,
                        ),
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
