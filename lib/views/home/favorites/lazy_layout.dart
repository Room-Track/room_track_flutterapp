import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutterapp/providers/favorites.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';
import 'package:room_track_flutterapp/views/home/favorites/failed.dart';
import 'package:room_track_flutterapp/views/home/favorites/page.dart';
import 'package:room_track_flutterapp/views/home/favorites/skeleton.dart';

class FavoritesLazyLayout extends ConsumerStatefulWidget {
  const FavoritesLazyLayout({super.key});

  @override
  ConsumerState<FavoritesLazyLayout> createState() =>
      _FavoritesLazyLayoutState();
}

class _FavoritesLazyLayoutState extends ConsumerState<FavoritesLazyLayout> {
  late Future<Iterable<FavoriteCardType>> _futureData;

  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(favoritesProvider).requestRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    _futureData = ref.watch(favoritesProvider).favorites;

    // TODO implementar reconexion continua al perder conexion con el server

    return FutureBuilder(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return FavoritesPageSkeleton();
          } else if (snapshot.hasData) {
            return FavoritesPage(favorites: snapshot.data!);
          } else {
            return FavoritesPageFailed();
          }
        });
  }
}
