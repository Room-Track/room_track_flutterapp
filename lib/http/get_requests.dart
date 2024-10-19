import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:room_track_flutterapp/env/env_variables.dart';
import 'package:room_track_flutterapp/types/favorite_card.dart';

class HttpGetRequests {
  static Future<Iterable<FavoriteCardType>> getTaggeds() async {
    final String token =
        (await FirebaseAuth.instance.currentUser?.getIdToken())!;
    final url = Uri.http(EnvVariables.API_URL, '/search/favorites');
    final res = await http.get(url, headers: {
      'authorization': token,
    });
    if (200 <= res.statusCode && res.statusCode < 300) {
      final Map<String, dynamic> body = jsonDecode(res.body);
      final List rawData = body['data'];
      return rawData.map((el) {
        return FavoriteCardType.fromJson(el);
      });
    }
    return [];
  }

  static Future<Iterable<FavoriteCardType>> getSearchQuery(String query) async {
    final String token =
        (await FirebaseAuth.instance.currentUser?.getIdToken())!;
    final url = Uri.http(EnvVariables.API_URL, '/search/', {
      'name': query,
    });
    final res = await http.get(url, headers: {
      'authorization': token,
    });
    if (200 <= res.statusCode && res.statusCode < 300) {
      final Map<String, dynamic> body = jsonDecode(res.body);
      final List rawData = body['data'];
      return rawData.map((el) {
        return FavoriteCardType.fromJson(el);
      });
    }
    return [];
  }
}
