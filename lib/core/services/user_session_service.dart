import 'package:shared_preferences/shared_preferences.dart';

class UserSessionService {
  final SharedPreferences _sharedPreferences;

  UserSessionService({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  static const String _keyLanguage = "language";

  Future<void> setLanguage({required String language}) async {
    await _sharedPreferences.setString(_keyLanguage, language);
  }

  String? getLanguage() {
    return _sharedPreferences.getString(_keyLanguage);
  }
}
