import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';

import '../areas/bottom_navbar.dart';
import '../areas/connection_stats.dart';
import '../areas/flag_area.dart';
import '../areas/location_area.dart';
import '../areas/location_condition_info.dart';
import '../states/notifiers.dart';
import '../theming/colors.dart';
import '../theming/text_styles.dart';
import '../utils/assets.dart';
import '../utils/sizes.dart';
import '../widgets/circle_button.dart';
import '../widgets/gradient_text.dart';
import '../widgets/overflow_circle.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.circleSizes,
    required this.maxHeight,
  });

  final List<double> circleSizes;
  final double maxHeight;
  @override
  Widget build(BuildContext context) {
    final connection = connectionState.reactiveValue(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: kBottomPadding),
          child: Stack(
            children: [
              if (connection == ConnectionState.none)
                Padding(
                  padding: EdgeInsets.only(bottom: maxHeight),
                  child: OverflowCircle(
                    size: maxHeight * 0.89,
                    paddingOffset: kBottomPadding * 0.5,
                    circleSizes: circleSizes,
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(top: maxHeight - (kBottomPadding * 0.78)),
                child: OverflowCircle(
                  size: maxHeight * 0.89,
                  circleSizes: connection != ConnectionState.none
                      ? circleSizes.sublist(3)
                      : circleSizes.sublist(2),
                ),
              ),
              const Center(
                child: CircleButton(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: maxHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: maxHeight * 0.075),
                child: connection == ConnectionState.active
                    ? const ConnectionStats()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            connection == ConnectionState.none ? kSurfIconGradient : kSurfIconPlain,
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
                                    color: connection == ConnectionState.none
                                        ? AppColors.tealBlue
                                        : AppColors.white,
                                    fontSize: 24,
                                    fontFamily: 'Antonio',
                                  ),
                                );
                                return connection == ConnectionState.none
                                    ? GradientWidget(child: text)
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
  }
}
