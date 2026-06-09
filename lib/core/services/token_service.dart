import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/services/backend_service.dart';
import 'package:travel_trek/core/services/prefs.dart';

/// Handles access token refresh and revocation.
class TokenService {
  TokenService._();

  /// Refreshes the access token using the stored refresh token.
  /// Returns the new access token on success, or null on failure.
  static Future<String?> refreshAccessToken() async {
    final accessToken = Prefs.getString(kUserAccessToken);
    final refreshToken = Prefs.getString(kRefreshToken);

    if (refreshToken.isEmpty) {
      log('[TokenService] No refresh token available.');
      return null;
    }

    try {
      final dio = Dio();
      final response = await dio.post(
        BackendService.refreshTokenUrl,
        data: {
          'accessToken': accessToken,
          'refreshToken': refreshToken,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
          validateStatus: (status) => status != null && status < 600,
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data as Map<String, dynamic>;
        // Try common response field names
        final newAccessToken =
            data['value']?['accessToken'] as String? ??
            data['accessToken'] as String? ??
            data['token'] as String?;

        final newRefreshToken =
            data['value']?['refreshToken'] as String? ??
            data['refreshToken'] as String?;

        if (newAccessToken != null) {
          await Prefs.setString(kUserAccessToken, newAccessToken);
          log('[TokenService] Access token refreshed successfully.');

          if (newRefreshToken != null) {
            await Prefs.setString(kRefreshToken, newRefreshToken);
          }
          return newAccessToken;
        }
      }

      log('[TokenService] Failed to refresh token. Status: ${response.statusCode}, body: ${response.data}');
      return null;
    } catch (e) {
      log('[TokenService] Exception during token refresh: $e');
      return null;
    }
  }

  /// Revokes a specific refresh token.
  static Future<bool> revokeToken() async {
    final refreshToken = Prefs.getString(kRefreshToken);
    if (refreshToken.isEmpty) return false;

    try {
      final dio = Dio();
      final accessToken = Prefs.getString(kUserAccessToken);
      final response = await dio.post(
        BackendService.revokeTokenUrl,
        data: {'refreshToken': refreshToken},
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
          validateStatus: (status) => status != null && status < 600,
        ),
      );
      final success = response.statusCode == 200 || response.statusCode == 204;
      log('[TokenService] revokeToken: ${success ? 'success' : 'failed (${response.statusCode})'}');
      return success;
    } catch (e) {
      log('[TokenService] Exception during revokeToken: $e');
      return false;
    }
  }

  /// Revokes all tokens for the current user.
  static Future<bool> revokeAllTokens() async {
    try {
      final dio = Dio();
      final accessToken = Prefs.getString(kUserAccessToken);
      final response = await dio.post(
        BackendService.revokeAllTokensUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
          validateStatus: (status) => status != null && status < 600,
        ),
      );
      final success = response.statusCode == 200 || response.statusCode == 204;
      log('[TokenService] revokeAllTokens: ${success ? 'success' : 'failed (${response.statusCode})'}');
      return success;
    } catch (e) {
      log('[TokenService] Exception during revokeAllTokens: $e');
      return false;
    }
  }
}
