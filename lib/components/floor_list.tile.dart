import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';
import 'package:room_track_flutterapp/views/info/floor/lazy_layout.dart';

class FloorListTile extends StatelessWidget {
  final int num;
  final FavoriteCardType info;

  const FloorListTile({
    super.key,
    required this.num,
    required this.info,
  });

  void _onPressedTile(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                FloorLazyLayout(num: num, info: info)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      splashColor: theme.colorScheme.secondary,
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      leading: Text(
        '$num',
        style: theme.textTheme.displaySmall,
        textAlign: TextAlign.start,
      ),
      title: Text("Floor"),
      subtitle: Text(
        num < 0
            ? "Underground"
            : num > 1
                ? "Take stairs"
                : "At ground level",
        style: TextStyle(color: theme.colorScheme.secondary),
      ),
      trailing: Icon(
        Icons.arrow_forward,
        size: 30,
      ),
      onTap: () {
        _onPressedTile(context);
      },
    );
  }
}
