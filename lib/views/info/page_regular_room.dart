import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';

class RegularRoomInfoPage extends StatelessWidget {
  final FavoriteCardType basicInfo;
  const RegularRoomInfoPage({
    super.key,
    required this.basicInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${basicInfo.name} is a Regular Room"),
      ),
    );
  }
}
