import 'package:flutter/material.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
      ),
      body: Center(
        child: Text("Theme Page.."),
      ),
    );
  }
}
