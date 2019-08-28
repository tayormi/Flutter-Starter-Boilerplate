import 'package:shared_preferences/shared_preferences.dart';
import 'package:specta_mobile/services/storage/IStorageService.dart';
import 'package:specta_mobile/utils/uidata.dart';

class SecureStorage implements IStorageService {
  // Create storage
  final _prefs = SharedPreferences.getInstance();
  final key = UIData.tokenKey;
  @override
  Future<void> deleteToken() async {
    // Delete a token from secure storage
    SharedPreferences storage = await _prefs;
    return await storage.remove(key);
  }

  @override
  Future<String> hasToken() async {
    // Check if there is a token in the secure storage
    SharedPreferences storage = await _prefs;
    String value = storage.getString(key);
    return value;
  }

  @override
  Future<void> persistToken(String token) async {
    // Write a token to secure storage
    SharedPreferences storage = await _prefs;
    return await storage.setString(key, token);
  }

  @override
  Future<String> getToken() async {
    // Get the token in the secure storage
    SharedPreferences storage = await _prefs;
    String value = storage.getString(key);
    return value;
  }
}
