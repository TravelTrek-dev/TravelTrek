import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/services/prefs.dart';
import 'package:travel_trek/core/services/token_service.dart';


class AuthInterceptor extends Interceptor {
  final Dio dio;

  bool _isRefreshing = false;

  AuthInterceptor({required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = Prefs.getString(kUserAccessToken);
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Only attempt refresh for 401 errors and only when not already refreshing.
    if (err.response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;
      log('[AuthInterceptor] 401 received – attempting token refresh...');

      try {
        final newToken = await TokenService.refreshAccessToken();

        if (newToken != null && newToken.isNotEmpty) {
          log('[AuthInterceptor] Token refreshed. Retrying original request...');

          // Retry the failed request with the new token.
          final retryOptions = err.requestOptions;
          retryOptions.headers['Authorization'] = 'Bearer $newToken';

          final retryResponse = await dio.fetch(retryOptions);
          handler.resolve(retryResponse);
          return;
        } else {
          log('[AuthInterceptor] Token refresh failed. Forwarding original error.');
        }
      } catch (e) {
        log('[AuthInterceptor] Exception during retry: $e');
      } finally {
        _isRefreshing = false;
      }
    }

    handler.next(err);
  }
}
