import 'package:flutter/material.dart';
import 'package:vpn_app/theming/colors.dart';
import 'package:vpn_app/utils/app_icons.dart';

class ConnectionStats extends StatefulWidget {
  const ConnectionStats({super.key});

  @override
  State<ConnectionStats> createState() => _ConnectionStatsState();
}

class _ConnectionStatsState extends State<ConnectionStats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Connected',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 30),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <IconData, Map<String, String>>{
              AppIcons.caretdoubledown: {'title': '158.2', 'subtitle': 'Mb/s'},
              AppIcons.harddrives: {'title': 'DE-FREE#1', 'subtitle': 'Server'},
              AppIcons.caretdoubleup: {'title': '158.2', 'subtitle': 'Mb/s'},
            }
                .entries
                .map(
                  (e) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Icon(
                          e.key,
                          size: 30,
                          color: AppColors.tealBlue,
                        ),
                      ),
                      Text(
                        e.value['title']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Antonio',
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        e.value['subtitle']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
                .toList()),
      ],
    );
  }
}
