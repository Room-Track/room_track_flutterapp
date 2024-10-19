import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';
import 'package:room_track_flutterapp/views/info/page.dart';

class FavoriteCard extends StatelessWidget {
  final FavoriteCardType info;

  const FavoriteCard({
    super.key,
    required this.info,
  });

  void _onTap(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => InfoPage(basicInfo: info)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.surfaceDim,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          _onTap(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 160,
            height: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /**
                 * name
                 */
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    info.name,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                /**
                 * Icon
                 */
                SvgPicture.asset(
                  info.icon,
                  width: 60,
                  height: 60,
                  colorFilter: ColorFilter.mode(
                    theme.colorScheme.onSurface,
                    BlendMode.srcIn,
                  ),
                ),
                /**
                 * type
                 */
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    info.type,
                    style: theme.textTheme.titleSmall,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
