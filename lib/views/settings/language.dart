import 'package:flutter/material.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language"),
      ),
      body: Center(
        child: Text("Language Page.."),
      ),
    );
  }
}