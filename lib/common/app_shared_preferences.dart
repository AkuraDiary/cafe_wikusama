import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  final SharedPreferences preferences;
  AppSharedPreferences({required this.preferences});

  updateToken(String token) {
    preferences.setString('access_token', token);
  }

  String? getToken() {
    return preferences.getString('access_token');
  }

  removeToken(BuildContext context) {
    preferences.remove('access_token');
  }
}
