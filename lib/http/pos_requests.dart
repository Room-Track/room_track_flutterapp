import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:room_track_flutterapp/env/env_variables.dart';

class HttpPostRequests {
  static Future<bool> addOneTagged(String name) async {
    final String token =
        (await FirebaseAuth.instance.currentUser?.getIdToken())!;
    final url = Uri.http(EnvVariables.API_URL, '/cards');
    final res = await http.post(
      url,
      headers: {
        'authorization': token,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "name": name,
      }),
    );
    if (200 <= res.statusCode && res.statusCode < 300) {
      return true;
    }
    return false;
  }
}
