import 'package:base_structure_project/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

/// get_it package => https://pub.dev/packages/get_it
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
