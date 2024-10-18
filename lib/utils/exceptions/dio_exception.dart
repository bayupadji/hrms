import 'package:dio/dio.dart';

class DioExceptionHandler {
  DioExceptionHandler(DioException error);

  static String handleException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out. Please try again.';
      case DioExceptionType.sendTimeout:
        return 'Send timeout. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout. Please try again.';
      case DioExceptionType.badResponse:
        if (error.response?.statusCode == 400) {
          return 'Bad request. Please check your email & password.';
        } else if (error.response?.statusCode == 401) {
          return 'Unauthorized. Please check your credentials.';
        } else if (error.response?.statusCode == 500) {
          return 'Internal server error. Please try again later.';
        } else {
          return 'Something went wrong: ${error.response?.statusCode}';
        }
      case DioExceptionType.cancel:
        return 'Request was cancelled. Please try again.';
      case DioExceptionType.unknown:
        return 'Network error. Please check your connection.';
      default:
        return 'Unexpected error occurred.';
    }
  }
}
