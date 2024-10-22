import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';

class HistoryNotifier extends ChangeNotifier {
  late List<FavoriteCardType> history;
  static const int maxSize = 10;

  HistoryNotifier({
    required this.history,
  });

  void pushHistory(FavoriteCardType card) {
    if (history.contains(card)) {
      history.removeWhere((item) => item.name == card.name);
    }
    if (history.length > maxSize) {
      return;
    }
    history.add(card);
    notifyListeners();
  }
}

final historyProvider = ChangeNotifierProvider<HistoryNotifier>(
  (ref) {
    return HistoryNotifier(history: []);
  },
);
