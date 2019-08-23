import 'package:meta/meta.dart';

abstract class IUserAuthRepository {
  Future<String> login({@required String username, @required String password});
  Future<void> hasToken();
  Future<void> persistToken(String token);
  Future<void> deleteToken();
}