import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/components/favorite_skeleton.dart';

class SearchByBuildingSkeleton extends StatelessWidget {
  const SearchByBuildingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buildings'),
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
