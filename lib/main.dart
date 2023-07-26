import 'package:flutter_persistent_value_notifier/flutter_persistent_value_notifier.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart' show WindowOptions, windowManager;

import 'pages/home_page.dart';
import 'states/notifiers.dart';
import 'theming/colors.dart';
import 'utils/platform_details.dart';
import 'widgets/circles.dart';

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
      home: Scaffold(
        body: LayoutBuilder(builder: (BuildContext ctx, BoxConstraints constraint) {
          final size = constraint.maxWidth;
          final List<double> circleSizes = [size * 0.776, size * 0.648, size * 0.52, size * 0.392];
          final circleSizes2 = [size * 1.1601, size * 0.8294, size * 0.57334];
          return Stack(
            children: [
              Circles(
                circleSizes: circleSizes,
                circleSizes2: circleSizes2,
              ),
              HomePage(
                circleSizes: circleSizes,
                maxHeight: constraint.maxHeight,
              ),
            ],
          );
        }),
      ),
    );
  }
}
