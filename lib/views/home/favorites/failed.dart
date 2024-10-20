import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutterapp/theme/icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritesPageFailed extends StatelessWidget {
  const FavoritesPageFailed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.appBar0),
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
