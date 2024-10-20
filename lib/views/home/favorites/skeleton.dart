import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/components/favorite_skeleton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritesPageSkeleton extends StatelessWidget {
  const FavoritesPageSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.appBar0),
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
