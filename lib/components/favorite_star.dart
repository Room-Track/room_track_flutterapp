import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutterapp/providers/favorites.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';

class FavoriteStar extends ConsumerStatefulWidget {
  final FavoriteCardType basicInfo;
  const FavoriteStar({
    super.key,
    required this.basicInfo,
  });

  @override
  ConsumerState<FavoriteStar> createState() => _FavoriteStar();
}

class _FavoriteStar extends ConsumerState<FavoriteStar> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.basicInfo.isFavorite;
  }

  void _toggleFavorite() {
    _isFavorite = !_isFavorite;
    if (_isFavorite) {
      ref.read(favoritesProvider).requestAdd(widget.basicInfo.name);
    } else {
      ref.read(favoritesProvider).requestRemove(widget.basicInfo.name);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(5),
      onPressed: _toggleFavorite,
      icon: Icon(
        _isFavorite ? Icons.star_sharp : Icons.star_outline,
      ),
    );
  }
}
