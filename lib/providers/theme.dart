import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends ChangeNotifier {
  String textSchemeName;
  String colorSchemeName;

  ThemeNotifier({
    required this.textSchemeName,
    required this.colorSchemeName,
  });

  void changeColorSchemeName(String schemeName) {
    colorSchemeName = schemeName;
    notifyListeners();
  }

  void changeTextSchemeName(String schemeName) {
    textSchemeName = schemeName;
    notifyListeners();
  }
}

final themeProvider = ChangeNotifierProvider<ThemeNotifier>((ref) {
  return ThemeNotifier(
    textSchemeName: "Medium",
    colorSchemeName: "Dark",
  );
});
