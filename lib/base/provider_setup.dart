import 'package:base_structure_project/providers/authentication_provider.dart';
import 'package:base_structure_project/providers/home_provider.dart';
import 'package:base_structure_project/providers/main_screen_provider.dart';
import 'package:base_structure_project/providers/profile_provider.dart';
import 'package:base_structure_project/providers/search_provider.dart';
import 'package:base_structure_project/services/cookie_service.dart';
import 'package:base_structure_project/services/web_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// provider_setup initializes the providers that are using in your app
List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

/// you should add your providers here to use
List<SingleChildWidget> independentServices = [
  Provider.value(value: CookieService()),
  ListenableProvider.value(value: AuthenticationLoginProvider()),
  ListenableProvider.value(value: MainScreenProvider()),
  ListenableProvider.value(value: HomeProvider()),
  ListenableProvider.value(value: ProfileProvider()),
  ListenableProvider.value(value: SearchProvider()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<CookieService, WebService>(
    update: (context, cookieService, webService) => webService == null
        ? WebService(
            cookieService: cookieService,
          )
        : webService.setDependencies(cookieService),
    create: (context) => WebService(),
  ),
];
