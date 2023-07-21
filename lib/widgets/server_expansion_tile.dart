import 'package:flutter/material.dart';
import 'package:vpn_app/states/notifier.dart';

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
            widget.location.countryFlag,
            width: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(widget.location.country.toUpperCase()),
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