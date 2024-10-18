// lib/data/services/api_service.dart
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> login(String email, String password) {
    return _dio.post(
      'http://192.168.18.52:8000/api/login',
      data: {'email': email, 'password': password},
    );
  }
}