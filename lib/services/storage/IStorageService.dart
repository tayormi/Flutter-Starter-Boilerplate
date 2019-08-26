abstract class IStorageService {
  Future<void> deleteToken();
  Future<void> persistToken(String token);
  Future<String> hasToken();
  Future<String> getToken();

}