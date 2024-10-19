import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/components/search_list_tile.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';

class SearchPageList extends StatefulWidget {
  final Iterable<FavoriteCardType> data;
  const SearchPageList({
    super.key,
    required this.data,
  });

  @override
  // ignore: no_logic_in_create_state
  State<SearchPageList> createState() => _SearchPageListState(data: data);
}

class _SearchPageListState extends State<SearchPageList> {
  final Iterable<FavoriteCardType> data;

  _SearchPageListState({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /**
         * Search list
         */
        ...data.map((el) => SearchListTile(info: el)),
      ],
    );
  }
}
