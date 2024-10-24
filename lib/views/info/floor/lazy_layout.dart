import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/http/get_requests.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';
import 'package:room_track_flutterapp/views/info/floor/failed.dart';
import 'package:room_track_flutterapp/views/info/floor/page_floor.dart';
import 'package:room_track_flutterapp/views/info/floor/skeleton.dart';

class FloorLazyLayout extends StatefulWidget {
  final int num;
  final FavoriteCardType info;
  const FloorLazyLayout({
    super.key,
    required this.num,
    required this.info,
  });

  @override
  State<FloorLazyLayout> createState() => _FloorLazyLayoutState();
}

class _FloorLazyLayoutState extends State<FloorLazyLayout> {
  late Future<Iterable<FavoriteCardType>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = HttpGetRequests.getAllFrom(widget.info.building, widget.num);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return FloorPageSkeleton(
              num: widget.num,
              info: widget.info,
            );
          } else if (snapshot.hasData) {
            return FloorPage(
              num: widget.num,
              info: widget.info,
              cards: snapshot.data!,
            );
          } else {
            return FloorPageFailed(
              num: widget.num,
              info: widget.info,
            );
          }
        });
  }
}
