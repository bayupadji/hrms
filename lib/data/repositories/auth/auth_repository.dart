// lib/data/repositories/auth_repository.dart
import 'package:dio/dio.dart';
import 'package:hrms/data/models/user/user_models.dart';
import 'package:hrms/data/services/api_service.dart';
import 'package:hrms/utils/exceptions/dio_exception.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await apiService.login(email, password);
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }
    } on DioException catch (error) {
      DioExceptionHandler(error);
    }
    return null;
  }
}
