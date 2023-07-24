import 'package:flutter/material.dart';
import 'package:vpn_app/states/notifiers.dart';
import 'package:vpn_app/theming/text_styles.dart';

import '../data/models/location_model.dart';
import '../theming/colors.dart';
import '../utils/app_icons.dart';
import 'server_location_details.dart';

class LocationExpansoinTile extends StatefulWidget {
  const LocationExpansoinTile({
    super.key,
    required this.location,
    this.isExpanded = false,
    this.showOnlyOptimal = false,
    this.showOnlyFavourite = false,
  });

  final LocationModel location;

  final bool isExpanded;

  final bool showOnlyOptimal;

  final bool showOnlyFavourite;

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
      maintainState: true,
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
      title: Row(
        children: [
          Image.asset(
            widget.location.countryFlag,
            width: 28,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              widget.location.country.toUpperCase(),
              style: AppTextStyles.antonioLight21Caps.copyWith(
                color: Theme.of(context).indicatorColor,
              ),
            ),
          ),
        ],
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Icon(
          _isExpanded ? AppIcons.caretup : AppIcons.caretdown,
          size: 22,
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.white
              : AppColors.lightStateGray60,
        ),
      ),
      onExpansionChanged: (value) {
        setState(() {
          _isExpanded = value;
        });
      },
      children: widget.location.servers
          .where((e) => widget.showOnlyFavourite ? favouriteIPs.value.contains(e.ip) : true)
          .map((e) => ServerLocationDetails(
                server: e,
                showIfOptimal: widget.showOnlyOptimal,
              ))
          .toList(),
    );
  }
}
