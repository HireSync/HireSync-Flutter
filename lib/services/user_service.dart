import 'dart:convert';
import 'dart:io';

import 'package:flutter_app/models/user.dart';
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

  Future<bool> registerUser(
    String email, String firstName, String password) async {
    final url = 'https://electric-difficult-liquid.glitch.me/users';

    final Map<String, dynamic> data = {
      
      'email': email,
      'firstName': firstName,
      'password': password,
      "isRecluter": 1,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == HttpStatus.ok) {
      
      final jsonResponse = response.body;
      final user = json.decode(jsonResponse);
      
    
      return user.isNotEmpty;
    }
    return false;
  }



Future<User?> getById(int id) async {

  http.Response response = await http.get(Uri.parse('$_baseUrl?id=$id'));
  if (response.statusCode == HttpStatus.ok) {
    final jsonResponse = json.decode(response.body);
    if (jsonResponse is List && jsonResponse.isNotEmpty) {
      // Si la respuesta es una lista no vacía, toma el primer elemento
      return User.fromJson(jsonResponse[id]);
    }
  }
  return null; // Devuelve null si no se encontró ningún usuario
}

Future<bool> updateUser(int id, String email, String firstName, String password, int phone) async {
  final url = 'https://electric-difficult-liquid.glitch.me/users/$id';

  final Map<String, dynamic> data = {
    'email': email,
    'firstName': firstName,
    'password': password,
    'phone': phone,
    // Agrega otros campos según sea necesario
  };

  final http.Response response = await http.put(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == HttpStatus.ok) {
    final jsonResponse = response.body;
    final updatedUser = json.decode(jsonResponse);
    return updatedUser.isNotEmpty;
  }

  return false;
}


}
