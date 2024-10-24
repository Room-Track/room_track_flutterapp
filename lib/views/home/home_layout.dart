import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutterapp/components/popup_menu.dart';
import 'package:room_track_flutterapp/providers/map_target.dart';
import 'package:room_track_flutterapp/theme/icon.dart';
import 'package:room_track_flutterapp/views/home/favorites/lazy_layout.dart';
import 'package:room_track_flutterapp/views/home/map/page.dart';
import 'package:room_track_flutterapp/views/home/search/page_initial.dart';
import 'package:room_track_flutterapp/views/settings/profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends ConsumerStatefulWidget {
  const HomeLayout({super.key});

  @override
  ConsumerState<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends ConsumerState<HomeLayout> {
  int _index = 1;

  final email = FirebaseAuth.instance.currentUser!.email!;

  String getUserName(String email) {
    return email.substring(0, email.indexOf("@"));
  }

  void _onDestinationSelected(int newIndex) {
    _index = newIndex;
    setState(() {});
  }

  void _onIconButtonPressedProfile() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProfileSettingsPage()));
  }

  Widget _getUserIcon() {
    return Image.asset(
      IconSchemePlaceHolder.profilePNG,
      fit: BoxFit.contain,
    );
  }

  void _goToMap() {
    _index = 2;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;
    final goToMap = ref.watch(mapTargetProvider).goToMap;
    if (goToMap) {
      _goToMap();
    }
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: theme.colorScheme.surface,
        leading: PopUpMenu(),
        title: const Text("Room Track"),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(getUserName(email)),
          ),
          IconButton(
            onPressed: _onIconButtonPressedProfile,
            icon: _getUserIcon(),
            padding: const EdgeInsets.all(5),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: theme.colorScheme.surfaceDim,
        ),
        child: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: _onDestinationSelected,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.star_border_outlined),
              label: lang.appBar0,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                IconSchemeButton.searchSVG,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
              label: lang.appBar1,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                IconSchemeButton.mapSVG,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
              label: lang.appBar2,
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _index,
        children: [
          const FavoritesLazyLayout(),
          const SearchPageInitial(),
          const MapPage(),
        ],
      ),
    );
  }
}
