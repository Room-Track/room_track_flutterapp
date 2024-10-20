import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutterapp/providers/theme.dart';
import 'package:room_track_flutterapp/theme/text.dart';

class FontSettingsPage extends ConsumerStatefulWidget {
  const FontSettingsPage({super.key});

  @override
  ConsumerState<FontSettingsPage> createState() => _FontSettingsPageState();
}

class _FontSettingsPageState extends ConsumerState<FontSettingsPage> {
  String _selected = '';

  void _onTap(String name) {
    if (name == _selected) {
      return;
    }
    _selected = name;
    ref.read(themeProvider).changeTextSchemeName(name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    _selected = ref.watch(themeProvider).textSchemeName;
    return Scaffold(
      appBar: AppBar(
        title: Text("Font"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select your preferred font size'),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: TextThemes.names.length,
                itemBuilder: (context, index) {
                  final name = TextThemes.names[index];
                  return ListTile(
                    title: Text(name),
                    trailing: _selected == name
                        ? Icon(Icons.check, color: theme.colorScheme.primary)
                        : null,
                    onTap: () {
                      _onTap(name);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
