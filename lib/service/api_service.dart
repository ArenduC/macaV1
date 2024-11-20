import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<http.Response> apiCallService({
    required String endpoint,
    required String method,
    dynamic headers,
    dynamic body,
  }) async {
    final url = Uri.parse(endpoint);
    headers ??= {'Content-Type': 'application/json'};

    switch (method.toUpperCase()) {
      case 'POST':
        return await http.post(
          url,
          headers: headers,
          body: json.encode(body),
        );
      case 'PUT':
        return await http.put(
          url,
          headers: headers,
          body: json.encode(body),
        );
      case 'DELETE':
        return await http.delete(
          url,
          headers: headers,
        );
      case 'GET':
      default:
        return await http.get(
          url,
          headers: headers,
        );
    }
  }
}
