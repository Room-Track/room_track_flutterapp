import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchListSkeleton extends StatelessWidget {
  const SearchListSkeleton({super.key});

  void _onPressedTile() {}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Shimmer.fromColors(
        baseColor: theme.colorScheme.secondary,
        highlightColor: theme.colorScheme.secondary.withAlpha(255),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          title: Container(
            height: 10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          subtitle: Text("XXXX"),
          trailing: Icon(
            Icons.pin_drop,
            size: 30,
          ),
          onTap: _onPressedTile,
        ));
  }
}
