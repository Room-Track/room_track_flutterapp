import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutterapp/providers/theme.dart';

class ThemeSettingsPage extends ConsumerStatefulWidget {
  ThemeSettingsPage({super.key});

  final List<Map<String, ThemeMode>> themes = [
    {'Light': ThemeMode.light},
    {'Dark': ThemeMode.dark},
    {'System': ThemeMode.system},
  ];

  @override
  ConsumerState<ThemeSettingsPage> createState() => _ThemeSettingsPageState();
}

class _ThemeSettingsPageState extends ConsumerState<ThemeSettingsPage> {
  String _selectedTheme = "";

  void _onTap(String name) {
    _selectedTheme = name;
    ref.read(themeProvider).changeColorSchemeName(name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    _selectedTheme = ref.watch(themeProvider).colorSchemeName;
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select your theme'),
            SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
              itemCount: widget.themes.length,
              itemBuilder: (context, index) {
                final name = widget.themes[index].keys.first;
                return ListTile(
                  title: Text(name),
                  trailing: _selectedTheme == name
                      ? Icon(Icons.check, color: theme.colorScheme.primary)
                      : null,
                  onTap: () {
                    _onTap(name);
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
