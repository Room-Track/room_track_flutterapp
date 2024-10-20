import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/components/favorite_card.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritesPage extends StatelessWidget {
  final Iterable<FavoriteCardType> favorites;

  const FavoritesPage({
    super.key,
    required this.favorites,
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
          children: [...favorites.map((el) => FavoriteCard(info: el))],
        ),
      ),
    );
  }
}
