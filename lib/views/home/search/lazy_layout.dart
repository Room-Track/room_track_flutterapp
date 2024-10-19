import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutterapp/http/get_requests.dart';
import 'package:room_track_flutterapp/providers/search_query.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';
import 'package:room_track_flutterapp/views/home/search/failed.dart';
import 'package:room_track_flutterapp/views/home/search/page_list.dart';
import 'package:room_track_flutterapp/views/home/search/skeleton.dart';

class SearchLazyLayout extends ConsumerStatefulWidget {
  const SearchLazyLayout({super.key});

  @override
  ConsumerState<SearchLazyLayout> createState() => _SearchLazyLayoutState();
}

class _SearchLazyLayoutState extends ConsumerState<SearchLazyLayout> {
  late Future<Iterable<FavoriteCardType>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = Future(() => []);
  }

  void _refreshData(String query) {
    _futureData = HttpGetRequests.getSearchQuery(query);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final query = ref.watch(searchQueryProvider).query;
    if (query != '') {
      _refreshData(query);
    }

    return FutureBuilder(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SearchPageSkeleton();
          } else if (snapshot.hasData) {
            return SearchPageList(data: snapshot.data!);
          } else {
            return SearchFailed();
          }
        });
  }
}
