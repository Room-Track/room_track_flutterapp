import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/views/settings/contact.dart';
import 'package:room_track_flutterapp/views/settings/font.dart';
import 'package:room_track_flutterapp/views/settings/language.dart';
import 'package:room_track_flutterapp/views/settings/profile.dart';
import 'package:room_track_flutterapp/views/settings/share.dart';
import 'package:room_track_flutterapp/views/settings/theme.dart';
import 'package:room_track_flutterapp/views/settings/usage.dart';
import 'package:room_track_flutterapp/views/settings/version.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({super.key});

  void _onSelected(BuildContext context, String value) {
    switch (value) {
      case "Profile":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProfileSettingsPage()));
        break;
      case "Language":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LanguageSettingsPage()));
        break;
      case "Font":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FontSettingsPage()));
        break;
      case "Theme":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ThemeSettingsPage()));
        break;
      case "Usage":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UsageSettingsPage()));
        break;
      case "Share":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ShareSettingsPage()));
        break;
      case "Contact":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ContactSettingsPage()));
        break;
      case "Version":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VersionSettingsPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        _onSelected(context, value);
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: "Profile",
            child: Text("Profile"),
          ),
          PopupMenuItem(
            value: "Language",
            child: Text("Language"),
          ),
          PopupMenuItem(
            value: "Font",
            child: Text("Font"),
          ),
          PopupMenuItem(
            value: "Theme",
            child: Text("Theme"),
          ),
          PopupMenuItem(
            value: "Usage",
            child: Text("Usage"),
          ),
          PopupMenuItem(
            value: "Share",
            child: Text("Share"),
          ),
          PopupMenuItem(
            value: "Contact",
            child: Text("Contact"),
          ),
          PopupMenuItem(
            value: "Version",
            child: Text("Version"),
          ),
        ];
      },
    );
  }
}
