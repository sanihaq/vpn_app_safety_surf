import 'package:flutter_persistent_value_notifier/flutter_persistent_value_notifier.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:flutter/material.dart';
import 'package:vpn_app/theming/text_styles.dart';
import 'package:vpn_app/utils/sizes.dart';
import 'package:vpn_app/widgets/gradient_text.dart';
import 'package:window_manager/window_manager.dart' show WindowOptions, windowManager;

import 'areas/bottom_navbar.dart';
import 'areas/connection_stats.dart';
import 'areas/flag_area.dart';
import 'areas/location_area.dart';
import 'areas/location_condition_info.dart';
import 'states/notifiers.dart';
import 'theming/colors.dart';
import 'utils/assets.dart';
import 'utils/platform_details.dart';
import 'widgets/circle_button.dart';
import 'widgets/circles.dart';
import 'widgets/overflow_circle.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initPersistentValueNotifier();

  if (PlatformDetails.instance.isDesktop && !PlatformDetails.instance.isWeb) {
    await windowManager.ensureInitialized();
    const windowOptions = WindowOptions(
      size: Size(375, 812),
      alwaysOnTop: true,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      windowManager.setResizable(false);
    });
  }

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModeValue = appThemeMode.reactiveValue(context);
    return MaterialApp(
      title: 'VPN App',
      themeMode: themeModeValue == 0
          ? ThemeMode.dark
          : themeModeValue == 1
              ? ThemeMode.light
              : ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        primaryColor: AppColors.indigo,
        highlightColor: AppColors.white,
        hintColor: AppColors.lightStateGray,
        canvasColor: AppColors.bg,
        cardColor: AppColors.white,
        indicatorColor: AppColors.black,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        primaryColor: AppColors.tealBlue,
        highlightColor: AppColors.charcoal,
        hintColor: AppColors.wildBlueYonder,
        canvasColor: AppColors.prussianBlue,
        cardColor: AppColors.charcoal,
        indicatorColor: AppColors.white,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradientBg,
        ),
        child: LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraint) {
            const bottomPadding = 160.0; // between 150 - 160
            final size = constraint.maxHeight;
            final littleCircleSizes = [
              size * 0.37,
              size * 0.31,
              size * 0.25,
              size * 0.19,
            ];
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: bottomPadding),
                  child: Stack(
                    children: [
                      Circles(
                        size: size,
                        sizes: littleCircleSizes,
                      ),
                      if (connectionState.reactiveValue(context) == ConnectionState.none)
                        Padding(
                          padding: EdgeInsets.only(bottom: size),
                          child: OverflowCircle(
                            size: size * 0.89,
                            paddingOffset: bottomPadding * 0.5,
                            littleCircleSizes: littleCircleSizes,
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.only(top: size - (bottomPadding * 0.78)),
                        child: OverflowCircle(
                          size: size * 0.89,
                          littleCircleSizes:
                              connectionState.reactiveValue(context) != ConnectionState.none
                                  ? littleCircleSizes.sublist(3)
                                  : littleCircleSizes.sublist(2),
                        ),
                      ),
                      const Center(
                        child: CircleButton(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: constraint.maxHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size * 0.075),
                        child: connectionState.reactiveValue(context) == ConnectionState.active
                            ? const ConnectionStats()
                            : Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    connectionState.reactiveValue(context) == ConnectionState.none
                                        ? kSurfIconGradient
                                        : kSurfIconPlain,
                                    width: kSizesSurfLogo,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Builder(builder: (context) {
                                        var text = Text(
                                          'SAFETY SURF',
                                          textAlign: TextAlign.center,
                                          style: AppTextStyles.antonioLight26Caps.copyWith(
                                            color: connectionState.reactiveValue(context) ==
                                                    ConnectionState.none
                                                ? AppColors.tealBlue
                                                : AppColors.white,
                                            fontSize: 24,
                                            fontFamily: 'Antonio',
                                          ),
                                        );
                                        return connectionState.reactiveValue(context) ==
                                                ConnectionState.none
                                            ? GradientText(text: text)
                                            : text;
                                      }),
                                    ],
                                  )
                                ],
                              ),
                      ),
                      const Column(
                        children: [
                          LocationConditionInfo(),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: FlagArea(),
                          ),
                          LocationArea(),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 30.0),
                            child: BottomNavbar(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
