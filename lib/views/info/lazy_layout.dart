import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/http/get_requests.dart';
import 'package:room_track_flutterapp/types/building_info.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';
import 'package:room_track_flutterapp/views/info/page_building.dart';
import 'package:room_track_flutterapp/views/info/page_regular_room.dart';

class InfoLazyLayout extends StatefulWidget {
  final FavoriteCardType basicInfo;
  const InfoLazyLayout({
    super.key,
    required this.basicInfo,
  });

  @override
  State<InfoLazyLayout> createState() => _InfoLazyLayoutState();
}

class _InfoLazyLayoutState extends State<InfoLazyLayout> {
  late Future<BuildingInfoType?> _buildingInfo;

  @override
  void initState() {
    super.initState();
    _buildingInfo = HttpGetRequests.getBuilding(widget.basicInfo.building);
  }

  Widget _getInfoPage(BuildingInfoType buildingInfo) {
    switch (widget.basicInfo.type) {
      case 'Building':
        return BuildingInfoPage(
            basicInfo: widget.basicInfo, buildingInfo: buildingInfo);
      default:
        return RegularRoomInfoPage(
            basicInfo: widget.basicInfo, buildingInfo: buildingInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buildingInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("waiting..");
          } else if (snapshot.hasData && snapshot.data != null) {
            return _getInfoPage(snapshot.data!);
          } else {
            return Text("error :c");
          }
        });
  }
}
