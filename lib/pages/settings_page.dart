import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:vpn_app/states/notifiers.dart';
import 'package:vpn_app/widgets/bottom_button.dart';

import '../theming/text_styles.dart';
import '../utils/app_icons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 60),
                Text(
                  'Settings',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.poppins16SemiBold.copyWith(
                    color: Theme.of(context).indicatorColor,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      ExpansionTile(
                        initiallyExpanded: true,
                        backgroundColor: Theme.of(context).cardColor,
                        collapsedBackgroundColor: Theme.of(context).cardColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        tilePadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        childrenPadding: const EdgeInsets.only(top: 2.0),
                        trailing: const SizedBox(),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Appearances",
                            style: AppTextStyles.antonioLight21Caps.copyWith(
                              color: Theme.of(context).indicatorColor,
                            ),
                          ),
                        ),
                        children: [
                          Column(
                            children: [
                              Divider(
                                color: Theme.of(context).canvasColor,
                                thickness: 2,
                                height: 0,
                                indent: 0,
                                endIndent: 0,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "Theme Mode",
                                        style: AppTextStyles.antonioLight21Caps.copyWith(
                                          color: Theme.of(context).indicatorColor,
                                        ),
                                      ),
                                    ),
                                    Builder(builder: (context) {
                                      final themeModeValue = appThemeMode.reactiveValue(context);

                                      return DropdownButton<ThemeMode>(
                                        value: themeModeValue == 0
                                            ? ThemeMode.dark
                                            : themeModeValue == 1
                                                ? ThemeMode.light
                                                : ThemeMode.system,
                                        style: AppTextStyles.poppins16Regular
                                            .copyWith(color: Theme.of(context).indicatorColor),
                                        items: const [
                                          DropdownMenuItem(
                                              value: ThemeMode.system, child: Text("System")),
                                          DropdownMenuItem(
                                              value: ThemeMode.light, child: Text("Light")),
                                          DropdownMenuItem(
                                              value: ThemeMode.dark, child: Text("Dark")),
                                        ],
                                        onChanged: (mode) {
                                          appThemeMode.value = mode == ThemeMode.dark
                                              ? 0
                                              : mode == ThemeMode.light
                                                  ? 1
                                                  : -1;
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    })
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
