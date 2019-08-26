import 'package:get_it/get_it.dart';
import 'package:specta_mobile/services/api/IApi.dart';
import 'package:specta_mobile/services/api/api.dart';

// ambient variable to access the service locator
GetIt serviceLocator = GetIt.instance;
void setupLocator() {
  serviceLocator.registerSingleton<IApi>(new Api());
}