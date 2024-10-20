import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/types/building_info.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';

class BuildingInfoPage extends StatelessWidget {
  final FavoriteCardType basicInfo;
  final BuildingInfoType buildingInfo;
  const BuildingInfoPage({
    super.key,
    required this.basicInfo,
    required this.buildingInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${basicInfo.name} is a Building"),
      ),
    );
  }
}
