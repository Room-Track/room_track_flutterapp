import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutterapp/types/building_info.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';

class MapTargetNotifier extends ChangeNotifier {
  FavoriteCardType? basicInfo;
  BuildingInfoType? buildingInfo;
  bool goToMap = false;

  MapTargetNotifier({
    required this.basicInfo,
    required this.buildingInfo,
  });

  void changeTarget(FavoriteCardType basic, BuildingInfoType building) {
    basicInfo = basic;
    buildingInfo = building;
    goToMap = true;
    notifyListeners();
  }

  void mapReached() {
    goToMap = false;
    notifyListeners();
  }

  void deleteTarget() {
    basicInfo = null;
    buildingInfo = null;
    notifyListeners();
  }
}

final mapTargetProvider = ChangeNotifierProvider<MapTargetNotifier>((ref) {
  return MapTargetNotifier(basicInfo: null, buildingInfo: null);
});
