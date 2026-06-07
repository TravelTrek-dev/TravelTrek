import 'package:dio/dio.dart';
import 'package:travel_trek/core/errors/custom_exception.dart';

class Api {
  final Dio dio;
  
  Api({required this.dio});

  Future<dynamic> get({required String url , String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': token});
    }

    try {
      Response response = await dio.get(url);
      return response;
    } on DioException catch (e) {
      throw Exception(
          'there is a problem with status code ${e.response?.statusCode ?? 400}');
    }
  }

Future<dynamic> post({dynamic body, String? token, required String url}) async {
  Map<String, String> headers = {};
  if (token != null) {
    headers.addAll({'Authorization': token});
  }

  try {
    Response response = await Dio().post(url, data: body, options: Options(headers: headers));
    return response.data;
  } on DioException catch (e) {
    if (e.response != null && e.response!.data != null) {
      throw CustomException(message:  e.response!.data['message'] ?? 'Unknown error');
    } else {
      throw CustomException(message: e.message ?? 'Connection error');
    }
  }
}

  Future<dynamic> put(
      {dynamic body, String? token, required String url}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': token});
    }

    try {
      Response response =
          await Dio().put(url, data: body, options: Options(headers: headers));
      Map<String, dynamic> data = response.data;
      print(data);
      return data;
    } on DioException catch (e) {
      throw Exception(
          'there is a problem with status code ${e.response?.statusCode ?? 408}');
    }
  }
}
