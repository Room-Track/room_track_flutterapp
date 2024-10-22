import 'package:flutter/widgets.dart';
import 'package:room_track_flutterapp/http/get_requests.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';
import 'package:room_track_flutterapp/views/home/search_by_building/failed.dart';
import 'package:room_track_flutterapp/views/home/search_by_building/page.dart';
import 'package:room_track_flutterapp/views/home/search_by_building/skeleton.dart';

class SearchByBuildingLazy extends StatefulWidget {
  const SearchByBuildingLazy({super.key});

  @override
  State<SearchByBuildingLazy> createState() => _SearchByBuildingLazyState();
}

class _SearchByBuildingLazyState extends State<SearchByBuildingLazy> {
  late Future<Iterable<FavoriteCardType>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = HttpGetRequests.getSearchByType('Building');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SearchByBuildingSkeleton();
          } else if (snapshot.hasData) {
            return SearchByBuildingPage(data: snapshot.data!);
          } else {
            return SearchByBuildingFailed();
          }
        });
  }
}
