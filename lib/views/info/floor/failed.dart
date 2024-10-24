import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutterapp/theme/icon.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';

class FloorPageFailed extends StatelessWidget {
  final int num;
  final FavoriteCardType info;
  const FloorPageFailed({
    super.key,
    required this.num,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Floor $num of ${info.building} Building'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              IconSchemeBackground.serverOffSVG,
              width: 70,
              height: 70,
              colorFilter:
                  ColorFilter.mode(theme.colorScheme.error, BlendMode.srcIn),
            ),
            SizedBox(height: 10),
            Text(
              "The server does not respond..",
              style: TextStyle(
                color: theme.colorScheme.error,
              ),
            )
          ],
        ),
      ),
    );
  }
}
