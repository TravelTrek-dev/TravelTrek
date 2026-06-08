import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_trek/Features/auth/domain/entity/user_entity.dart';
import 'dart:convert';

import 'package:travel_trek/constants.dart';

class Prefs {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static void setBool(String key, bool value) {
    _instance.setBool(key, value);
  }

  static Future<void> setString(String key, String value) async {
    await _instance.setString(key, value);
  }

  static bool getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  static String getString(String key) {
    return _instance.getString(key) ?? '';
  }

  static Future<void> setUserEntity(UserEntity userEntity) async {
    String jsonString = jsonEncode(userEntity.toJson());

    await _instance.setString(kUserEntity, jsonString);
  }

  static Future<void> removeUserEntity() async {
    await _instance.remove(kUserEntity);
  }

  static UserEntity? getUserEntity() {
    String? jsonString = _instance.getString(kUserEntity);
    if (jsonString == null || jsonString.isEmpty) {
      return null;
    }
    try {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return UserEntity.fromJson(jsonMap);
    } catch (e) {
      log("Error parsing UserEntity: $e");
      return null;
    }
  }
}
