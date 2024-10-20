import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends ChangeNotifier {
  String textSchemeName;
  String colorSchemeName;
  String languageCode;

  ThemeNotifier({
    required this.textSchemeName,
    required this.colorSchemeName,
    required this.languageCode,
  });

  void changeColorSchemeName(String schemeName) {
    colorSchemeName = schemeName;
    notifyListeners();
  }

  void changeTextSchemeName(String schemeName) {
    textSchemeName = schemeName;
    notifyListeners();
  }

  void changeLanguageCode(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }
}

final themeProvider = ChangeNotifierProvider<ThemeNotifier>((ref) {
  return ThemeNotifier(
    textSchemeName: "Medium",
    colorSchemeName: "Dark",
    languageCode: 'en',
  );
});
