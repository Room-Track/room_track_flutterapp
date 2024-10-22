import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/components/favorite_card.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';

class SearchByBuildingPage extends StatelessWidget {
  final Iterable<FavoriteCardType> data;

  const SearchByBuildingPage({
    super.key,
    required this.data,
  });

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
          children: [...data.map((el) => FavoriteCard(info: el))],
        ),
      ),
    );
  }
}
