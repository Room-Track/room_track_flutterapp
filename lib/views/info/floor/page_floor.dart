import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutterapp/components/favorite_card.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';

class FloorPage extends ConsumerWidget {
  final int num;
  final FavoriteCardType info;
  final Iterable<FavoriteCardType> cards;

  const FloorPage({
    super.key,
    required this.num,
    required this.info,
    required this.cards,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floor $num of ${info.building} Building'),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            runSpacing: 10,
            children: [...cards.map((el) => FavoriteCard(info: el))],
          ),
        ),
      ),
    );
  }
}
