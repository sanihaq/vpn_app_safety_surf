import 'package:flutter/material.dart';
import 'package:vpn_app/data/models/location_model.dart';
import 'package:vpn_app/data/servers_list_data.dart';
import 'package:vpn_app/states/notifiers.dart';
import 'package:vpn_app/theming/colors.dart';
import 'package:vpn_app/theming/text_styles.dart';
import 'package:vpn_app/utils/assets.dart';
import 'package:vpn_app/widgets/bottom_button.dart';
import 'package:vpn_app/widgets/power_button.dart';

import '../utils/app_icons.dart';
import '../widgets/app_tab.dart';
import '../widgets/server_expansion_tile.dart';

class ServersPage extends StatefulWidget {
  const ServersPage({super.key});

  @override
  State<ServersPage> createState() => _ServersPageState();
}

class _ServersPageState extends State<ServersPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  bool isSortReversed = false;

  List<LocationModel> serverList = [...serverLocationsList];

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
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 60),
            Text(
              'Server location',
              textAlign: TextAlign.center,
              style: AppTextStyles.poppins16SemiBold.copyWith(
                color: Theme.of(context).indicatorColor,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppTab(
                  isActive: tabController.index == 0,
                  icon: AppIcons.harddrives,
                  activeIcon: AppIcons.harddrivesfill,
                  text: "All server",
                  onTap: () {
                    tabController.animateTo(0);
                  },
                ),
                AppTab(
                  isActive: tabController.index == 1,
                  icon: AppIcons.lightning,
                  activeIcon: AppIcons.lightningFill,
                  text: "Optimal",
                  onTap: () {
                    tabController.animateTo(1);
                  },
                ),
                AppTab(
                  isActive: tabController.index == 2,
                  icon: AppIcons.heart,
                  activeIcon: AppIcons.heartFill,
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
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: serverList
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: LocationExpansoinTile(location: e),
                              ),
                            )
                            .toList(),
                      ),
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Image.asset(kEmojiSalut, width: 28),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                        child: Text(
                                          'FREE 7 DAYS UNLIM',
                                          style: AppTextStyles.antonioLight21Caps.copyWith(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const PowerButton(
                                  type: PowerButtonType.white,
                                  iconData: AppIcons.crown,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: serverList
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child:
                                          LocationExpansoinTile(location: e, showOnlyOptimal: true),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: serverList
                            .where((e) => e.servers.any((el) => favoriteIPs.value.contains(el.ip)))
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: LocationExpansoinTile(
                                  location: e,
                                  showOnlyFavourite: true,
                                  isExpanded: true,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationButton(
                    icon: AppIcons.arrowsclockwise,
                    onTap: () {},
                  ),
                  BottomNavigationButton(
                    icon: AppIcons.x,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  BottomNavigationButton(
                    icon: isSortReversed ? AppIcons.sortdescending : AppIcons.sortascending,
                    onTap: () {
                      setState(() {
                        isSortReversed = !isSortReversed;
                        serverList = [...serverList.reversed];
                      });
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
