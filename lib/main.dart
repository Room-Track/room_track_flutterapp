import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutterapp/firebase_options.dart';
import 'package:room_track_flutterapp/providers/theme.dart';
import 'package:room_track_flutterapp/theme/color.dart';
import 'package:room_track_flutterapp/theme/text.dart';
import 'package:room_track_flutterapp/views/auth/auth_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(themeProvider);
    ColorScheme colorScheme =
        ColorThemes.getScheme(appTheme.colorSchemeName, context);
    TextTheme textScheme = TextThemes.getScheme(appTheme.textSchemeName);
    return MaterialApp(
      theme: ThemeData(
        colorScheme: colorScheme,
        textTheme: textScheme,
        splashColor: colorScheme.secondary,
        useMaterial3: true,
      ),
      title: 'Room Track',
      home: const Authlayout(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(appTheme.languageCode),
    );
  }
}
