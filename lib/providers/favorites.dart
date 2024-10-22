import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutterapp/http/del_requests.dart';
import 'package:room_track_flutterapp/http/get_requests.dart';
import 'package:room_track_flutterapp/http/pos_requests.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';

class FavoritesNotifier extends ChangeNotifier {
  Future<Iterable<FavoriteCardType>> favorites;

  FavoritesNotifier({
    required this.favorites,
  });

  void requestRefresh() {
    favorites = HttpGetRequests.getTaggeds();
    notifyListeners();
  }

  void requestRemove(String name) async {
    await HttpDeleteRequests.removeOneTagged(name);
    requestRefresh();
  }

  void requestAdd(String name) async {
    await HttpPostRequests.addOneTagged(name);
    requestRefresh();
  }
}

final favoritesProvider = ChangeNotifierProvider<FavoritesNotifier>((ref) {
  return FavoritesNotifier(favorites: Future(() => []));
});
