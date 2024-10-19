import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_track_flutterapp/components/popup_menu.dart';
import 'package:room_track_flutterapp/theme/icon.dart';
import 'package:room_track_flutterapp/views/home/favorites/lazy_layout.dart';
import 'package:room_track_flutterapp/views/home/map/page.dart';
import 'package:room_track_flutterapp/views/home/search/page_initial.dart';
import 'package:room_track_flutterapp/views/settings/profile.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
              label: 'Favorites',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                IconSchemeButton.searchSVG,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Search',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(IconSchemeButton.mapSVG),
              label: 'Map',
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
