import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/components/favorite_star.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';
import 'package:room_track_flutterapp/views/info/lazy_layout.dart';

class InfoPage extends StatelessWidget {
  final FavoriteCardType basicInfo;
  const InfoPage({
    super.key,
    required this.basicInfo,
  });

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
      body: InfoLazyLayout(basicInfo: basicInfo),
    );
  }
}
