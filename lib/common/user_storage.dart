import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyToken = 'tokenWatchIt';
  static const _keyUsername = 'usernameWatchIt';
  static const _keyPassword = 'passwordWatchIt';
  static const _keyRememberMe = 'rememberMeWatchIt';

  static Future setToken(String token) async => await _storage.write(key: _keyToken, value: token);

  static Future deleteToken() async => await _storage.delete(key: _keyToken);

  static Future<String?> getToken() async => await _storage.read(key: _keyToken);

  static Future setUsername(String username) async => await _storage.write(key: _keyUsername, value: username);

  static Future deleteUsername() async => await _storage.delete(key: _keyUsername);

  static Future<String?> getUsername() async => await _storage.read(key: _keyUsername);

  static Future setPassword(String password) async => await _storage.write(key: _keyPassword, value: password);

  static Future deletePassword() async => await _storage.delete(key: _keyPassword);

  static Future<String?> getPassword() async => await _storage.read(key: _keyPassword);

  static Future setRememberMe(bool rememberMe) async => await _storage.write(key: _keyRememberMe, value: jsonEncode(rememberMe));

  static Future deleteRememberMe() async => await _storage.delete(key: _keyRememberMe);

  static Future<bool?> getRememberMe() async => await _storage.read(key: _keyRememberMe).then((value) => value != null ? jsonDecode(value) : false);
}
