import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:room_track_flutterapp/components/floor_list.tile.dart';
import 'package:room_track_flutterapp/providers/map_target.dart';
import 'package:room_track_flutterapp/types/building_info.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';

class BuildingInfoPage extends ConsumerWidget {
  final FavoriteCardType basicInfo;
  final BuildingInfoType buildingInfo;
  const BuildingInfoPage({
    super.key,
    required this.basicInfo,
    required this.buildingInfo,
  });

  void _onMapTap() {}
  void _onGoTap(BuildContext context, WidgetRef ref) {
    Navigator.popUntil(context, (route) => route.isFirst);
    ref.read(mapTargetProvider).changeTarget(basicInfo, buildingInfo);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final styleDesc = TextStyle(
      color: theme.colorScheme.secondary.withAlpha(200),
      fontWeight: theme.textTheme.titleLarge?.fontWeight,
      fontSize: theme.textTheme.titleLarge?.fontSize,
    );
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /**
             * General Location
             */
            Text(
              "General Location",
              style: theme.textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.blueGrey,
                    child: Stack(
                      children: [
                        Center(
                          child: Text("Map Image"),
                        ),
                        Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: _onMapTap,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reference",
                      style: theme.textTheme.titleLarge,
                    ),
                    Text(
                      buildingInfo.inside ? "Inside of USM" : 'Outside of USM',
                      style: styleDesc,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      basicInfo.name,
                      style: theme.textTheme.titleLarge,
                    ),
                    SvgPicture.asset(
                      basicInfo.icon,
                      height: 30,
                      width: 30,
                      colorFilter: ColorFilter.mode(
                        theme.colorScheme.secondary.withAlpha(200),
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 50),
            /**
             * Go
             */
            TextButton(
              onPressed: () {
                _onGoTap(context, ref);
              },
              style: TextButton.styleFrom(
                overlayColor: theme.colorScheme.onPrimary,
                padding: const EdgeInsets.all(15),
                backgroundColor: theme.colorScheme.primary,
              ),
              child: Center(
                child: Text(
                  "Go",
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: theme.textTheme.bodyLarge?.fontSize,
                    fontWeight: theme.textTheme.bodyLarge?.fontWeight,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            /**
             * Floors
             */
            Text(
              "Floors",
              style: theme.textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            ...List.generate(buildingInfo.topFloor - buildingInfo.botFloor,
                (idx) => idx + buildingInfo.botFloor).map(
              (idx) => idx != 0
                  ? FloorListTile(num: idx, info: basicInfo)
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
