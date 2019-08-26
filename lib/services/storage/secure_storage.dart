import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:specta_mobile/services/storage/IStorageService.dart';
import 'package:specta_mobile/utils/uidata.dart';

class SecureStorage implements IStorageService {
  // Create storage
  final storage = new FlutterSecureStorage();
  final key = UIData.tokenKey;
  @override
  Future<void> deleteToken() async {
    // Delete a token from secure storage
    return await storage.delete(key: key);
  }

  @override
  Future<String> hasToken() async {
    // Check if there is a token in the secure storage
    String value = await storage.read(key: key);
    return value;
  }

  @override
  Future<void> persistToken(String token) async {
    // Write a token to secure storage
    return await storage.write(key: key, value: token);
  }

  @override
  Future<String> getToken() async {
    // Get the token in the secure storage
    String value = await storage.read(key: key);
    return value;
  }
}
