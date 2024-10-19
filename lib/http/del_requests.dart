import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:room_track_flutterapp/env/env_variables.dart';

class HttpDeleteRequests {
  static Future<bool> removeOneTagged(String name, String type) async {
    final String token =
        (await FirebaseAuth.instance.currentUser?.getIdToken())!;
    final url = Uri.http(EnvVariables.API_URL, '/cards/');
    final res = await http.delete(
      url,
      headers: {'authorization': token},
      body: {
        name: name,
        type: type,
      },
    );
    if (200 <= res.statusCode && res.statusCode < 300) {
      return true;
    }
    return false;
  }
}
