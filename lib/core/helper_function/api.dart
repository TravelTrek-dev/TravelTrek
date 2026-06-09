import 'package:dio/dio.dart';
import 'package:travel_trek/core/errors/custom_exception.dart';

class Api {
  final Dio dio;

  Api({required this.dio});

  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      Response response = await dio.get(
        url,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      final errorData = e.response?.data;
      final message = errorData is Map<String, dynamic>
          ? errorData['message']?.toString()
          : null;
      throw CustomException(
        message:
            message ??
            e.message ??
            'Connection error with status ${e.response?.statusCode}',
      );
    }
  }

  Future<dynamic> post({
    dynamic body,
    String? token,
    required String url,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      Response response = await dio.post(
        url,
        data: body,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      final errorData = e.response?.data;
      final message = errorData is Map<String, dynamic>
          ? errorData['message']?.toString()
          : null;
      throw CustomException(
        message: message ?? e.message ?? 'Connection error',
      );
    }
  }

  Future<dynamic> put({
    dynamic body,
    String? token,
    required String url,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      Response response = await dio.put(
        url,
        data: body,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      final errorData = e.response?.data;
      final message = errorData is Map<String, dynamic>
          ? errorData['message']?.toString()
          : null;
      throw CustomException(
        message:
            message ??
            e.message ??
            'Connection error with status ${e.response?.statusCode}',
      );
    }
  }

  Future<dynamic> delete({
    String? token,
    required String url,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      Response response = await dio.delete(
        url,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      final errorData = e.response?.data;
      final message = errorData is Map<String, dynamic>
          ? errorData['message']?.toString()
          : null;
      throw CustomException(
        message:
            message ??
            e.message ??
            'Connection error with status ${e.response?.statusCode}',
      );
    }
  }
}
