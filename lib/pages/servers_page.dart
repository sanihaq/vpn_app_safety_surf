import 'package:flutter/material.dart';
import 'package:vpn_app/theming/colors.dart';
import 'package:vpn_app/utils/assets.dart';
import 'package:vpn_app/widgets/bottom_button.dart';
import 'package:vpn_app/widgets/connection_health_indicator.dart';
import 'package:vpn_app/widgets/power_button.dart';

import '../utils/app_icons.dart';
import '../widgets/app_tab.dart';

class ServersPage extends StatefulWidget {
  const ServersPage({super.key});

  @override
  State<ServersPage> createState() => _ServersPageState();
}

class _ServersPageState extends State<ServersPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.bg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 60),
            Text(
              'Server location',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppTab(
                  isActive: tabController.index == 0,
                  icon: AppIcons.harddrives,
                  activeIcon: AppIcons.harddrives_fill,
                  text: "All server",
                  onTap: () {
                    tabController.animateTo(0);
                  },
                ),
                AppTab(
                  isActive: tabController.index == 1,
                  icon: AppIcons.lightning,
                  activeIcon: AppIcons.lightning_fill,
                  text: "Optimal",
                  onTap: () {
                    tabController.animateTo(1);
                  },
                ),
                AppTab(
                  isActive: tabController.index == 2,
                  icon: AppIcons.heart,
                  activeIcon: AppIcons.heart_fill,
                  text: "Favourites",
                  color: AppColors.pink,
                  onTap: () {
                    tabController.animateTo(2);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: TabBarView(
                  controller: tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        LocationExpansoinTile(),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.yellow,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Image.asset(kEmojiSalut, width: 28),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                        child: Text(
                                          'FREE 7 DAYS UNLIM',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Antonio',
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                PowerButton(),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        LocationExpansoinTile(),
                      ],
                    ),
                    Column(
                      children: [
                        LocationExpansoinTile(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationButton(
                    icon: AppIcons.arrowsclockwise,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  BottomNavigationButton(
                    icon: AppIcons.x,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  BottomNavigationButton(
                    icon: AppIcons.sortascending,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationExpansoinTile extends StatefulWidget {
  const LocationExpansoinTile({
    super.key,
    this.isExpanded = false,
  });

  final bool isExpanded;

  @override
  State<LocationExpansoinTile> createState() => _LocationExpansoinTileState();
}

class _LocationExpansoinTileState extends State<LocationExpansoinTile> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: widget.isExpanded,
      backgroundColor: AppColors.white,
      collapsedBackgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Row(
        children: [
          Image.asset(
            kFlagFrance,
            width: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text("FRANCE"),
          ),
        ],
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Icon(
          _isExpanded ? AppIcons.caretup : AppIcons.caretdown,
          size: 22,
          color: AppColors.lightStateGray60,
        ),
      ),
      onExpansionChanged: (value) {
        setState(() {
          _isExpanded = value;
        });
      },
      tilePadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      childrenPadding: const EdgeInsets.only(top: 2.0),
      children: [
        ServerLocationDetails(),
        ServerLocationDetails(),
      ],
    );
  }
}

class ServerLocationDetails extends StatelessWidget {
  const ServerLocationDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: AppColors.bg,
          thickness: 2,
          height: 0,
          indent: 0,
          endIndent: 0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ConnectionHealthIndicator(),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'LX-FREE#1',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Antonio',
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: Icon(
                          AppIcons.lightning_fill,
                          size: 18,
                          color: AppColors.indigo,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Ping: 67 ms',
                          style: TextStyle(
                            color: Color(0xFF7C858D),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              PowerButton()
            ],
          ),
        ),
      ],
    );
  }
}
