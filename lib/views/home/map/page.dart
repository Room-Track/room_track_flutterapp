import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:room_track_flutterapp/providers/map_target.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  void _reached() {
    ref.read(mapTargetProvider).mapReached();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(mapTargetProvider);
    if (provider.goToMap) {
      Future(() {
        _reached();
      });
    }

    return Scaffold(
      body: Center(
        child: Text("${provider.basicInfo}\n${provider.buildingInfo}"),
      ),
    );
  }
}
