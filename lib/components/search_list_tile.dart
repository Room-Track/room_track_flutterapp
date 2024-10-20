import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';
import 'package:room_track_flutterapp/views/info/page.dart';

class SearchListTile extends StatelessWidget {
  final FavoriteCardType info;
  const SearchListTile({
    super.key,
    required this.info,
  });

  void _onPressedIcon() {}
  void _onPressedTile(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => InfoPage(basicInfo: info)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      splashColor: theme.colorScheme.secondary,
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      leading: SvgPicture.asset(
        info.icon,
        height: 35,
        width: 35,
        colorFilter: ColorFilter.mode(
          theme.colorScheme.onSurface,
          BlendMode.srcIn,
        ),
      ),
      title: Text(info.name),
      subtitle: Text(
        info.type,
        style: TextStyle(color: theme.colorScheme.secondary),
      ),
      trailing: IconButton(
        onPressed: _onPressedIcon,
        icon: Icon(
          Icons.pin_drop,
          size: 30,
        ),
      ),
      onTap: () {
        _onPressedTile(context);
      },
    );
  }
}
