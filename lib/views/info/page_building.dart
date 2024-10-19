import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';

class BuildingInfoPage extends StatelessWidget {
  final FavoriteCardType basicInfo;
  const BuildingInfoPage({
    super.key,
    required this.basicInfo,
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
