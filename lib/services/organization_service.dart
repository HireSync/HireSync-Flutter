import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class OrganizationService {
  final String _baseUrl =
      'https://electric-difficult-liquid.glitch.me/organizations';

  Future<bool> createOrganization(String name) async {
    final Map<String, dynamic> data = {'name': name, 'recruitments': []};

    final http.Response response = await http.post(
      Uri.parse(_baseUrl),
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

  Future<List<Map<String, dynamic>>?> getAllOrganizations() async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = response.body;
      final List<dynamic> organizations = json.decode(jsonResponse);
      if (organizations is List<dynamic>) {
        return List<Map<String, dynamic>>.from(organizations);
      }
    }
    return null;
  }

  Future<bool> addRecruitmentToOrganization(
    int organizationId,
    Map<String, dynamic> recruitmentData,
  ) async {
    try {
      final String recruitmentUrl = '$_baseUrl/$organizationId/recruitments';
      final http.Response response = await http.post(
        Uri.parse(recruitmentUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(recruitmentData),
      );
      print('Respuesta del servidor: ${response.body}');
      if (response.statusCode == HttpStatus.ok) {
        final jsonResponse = response.body;
        final recruitment = json.decode(jsonResponse);
        return recruitment.isNotEmpty;
      }
      return false;
    } catch (e) {
      print('Error al enviar solicitud: $e');
      return false;
    }
  }
}
