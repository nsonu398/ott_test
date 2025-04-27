// lib/core/api/api_client.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../errors/exceptions.dart';
import '../config/app_config.dart';

class ApiClient {
  final http.Client httpClient;
  final baseUrl = AppConfig.instance.apiBaseUrl;

  ApiClient(this.httpClient);

  Future<Map<String, dynamic>> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await httpClient.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // Add auth token if needed
          // 'Authorization': 'Bearer ${AppConfig.instance.authToken}',
        },
      );

      return _processResponse(response);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<Map<String, dynamic>> post(
      String endpoint, {
        required Map<String, dynamic> body,
      }) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await httpClient.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // Add auth token if needed
          // 'Authorization': 'Bearer ${AppConfig.instance.authToken}',
        },
        body: json.encode(body),
      );

      return _processResponse(response);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<Map<String, dynamic>> put(
      String endpoint, {
        required Map<String, dynamic> body,
      }) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await httpClient.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // Add auth token if needed
          // 'Authorization': 'Bearer ${AppConfig.instance.authToken}',
        },
        body: json.encode(body),
      );

      return _processResponse(response);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<Map<String, dynamic>> delete(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await httpClient.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // Add auth token if needed
          // 'Authorization': 'Bearer ${AppConfig.instance.authToken}',
        },
      );

      return _processResponse(response);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException(
        message: 'Error occurred with status code: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    }
  }
}