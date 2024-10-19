import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/components/favorite_star.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';
import 'package:room_track_flutterapp/views/info/page_building.dart';
import 'package:room_track_flutterapp/views/info/page_regular_room.dart';

class InfoPage extends StatelessWidget {
  final FavoriteCardType basicInfo;
  const InfoPage({
    super.key,
    required this.basicInfo,
  });

  Widget _getInfoPage() {
    switch (basicInfo.type) {
      case 'Building':
        return BuildingInfoPage(basicInfo: basicInfo);
      default:
        return RegularRoomInfoPage(basicInfo: basicInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(basicInfo.type),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: FavoriteStar(basicInfo: basicInfo),
          ),
        ],
      ),
      body: _getInfoPage(),
    );
  }
}
