import 'package:meta/meta.dart';
import 'package:specta_mobile/manager/UserAuthRepository/IUserAuthRepository.dart';

class UserAuthManager implements IUserAuthRepository {
  @override
  Future<void> deleteToken() async {
    // TODO: implement deleteToken
    return null;
  }

  @override
  Future<void> hasToken() async {
    // TODO: implement hasToken
    return null;
  }

  @override
  Future<String> login({@required String username, @required String password}) {
    // TODO: implement login
    return null;
  }

  @override
  Future<void> persistToken(String token) {
    // TODO: implement persistToken
    return null;
  }
  
}