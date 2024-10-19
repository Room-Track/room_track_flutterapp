import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:room_track_flutterapp/components/settings_tile.dart';
import 'package:room_track_flutterapp/theme/icon.dart';

class ProfileSettingsPage extends StatelessWidget {
  ProfileSettingsPage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  String getUserName(String email) {
    return email.substring(0, email.indexOf("@"));
  }

  void _changeImage() {}

  void _editProfile() {}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /**
               * Profile image
               */
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: theme.colorScheme.surfaceBright,
                    backgroundImage:
                        AssetImage(IconSchemePlaceHolder.profilePNG),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: _changeImage,
                      icon: Icon(Icons.camera_alt),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              /**
               * Correo
               */
              Text("${user.email}", style: theme.textTheme.bodyMedium),
              SizedBox(height: 20),
              /**
               * Editar perfil
               */
              ElevatedButton.icon(
                onPressed: _editProfile,
                icon: Icon(Icons.edit),
                label: Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 30),
              /**
               * Division
               */
              Divider(),
              /**
               * Change paswword
               */
              SettingsTile(
                icon: Icons.lock_outline,
                title: 'Change Password',
                onTap: () {},
                iconColor: theme.colorScheme.primary,
              ),
              /**
               * Sign out
               */
              SettingsTile(
                icon: Icons.logout,
                title: 'Sign Out',
                exit: true,
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                iconColor: theme.colorScheme.error,
              )
            ],
          ),
        ),
      ),
    );
  }
}
