import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/components/search_list_skeleton.dart';

class SearchPageSkeleton extends StatefulWidget {
  const SearchPageSkeleton({super.key});

  @override
  State<SearchPageSkeleton> createState() => _SearchPageSkeletonState();
}

class _SearchPageSkeletonState extends State<SearchPageSkeleton> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /**
         * Search list
         */
        ...List.generate(
          10,
          (idx) => SearchListSkeleton(),
        ),
      ],
    );
  }
}
