import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class UserService {
  final String _baseUrl = 'https://electric-difficult-liquid.glitch.me/users?';
  final String _email = 'email=';
  final String _password = '&password=';

  Future<bool> authenticate(String email, String password) async {
    final url = '$_baseUrl$_email$email$_password$password';

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = response.body;
      final users = json.decode(jsonResponse);
      return users.isNotEmpty;
    }
    return false;
  }
}
