import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/components/favorite_skeleton.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';

class FloorPageSkeleton extends StatelessWidget {
  final int num;
  final FavoriteCardType info;
  const FloorPageSkeleton({
    super.key,
    required this.num,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floor $num of ${info.building} Building'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 10,
          runSpacing: 10,
          children: List.generate(5, (idx) {
            return FavoriteSkeleton();
          }),
        ),
      ),
    );
  }
}
