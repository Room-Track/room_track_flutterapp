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

  void requestRemove(String name, String type) async {
    await HttpDeleteRequests.removeOneTagged(name, type);
    requestRefresh();
  }

  void requestAdd(String name, String type) async {
    await HttpPostRequests.addOneTagged(name, type);
    requestRefresh();
  }
}

final favoritesProvider = ChangeNotifierProvider<FavoritesNotifier>((ref) {
  return FavoritesNotifier(favorites: Future(() => []));
});
