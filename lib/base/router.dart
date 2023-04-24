import 'package:base_structure_project/const_values/route_paths.dart';
import 'package:base_structure_project/ui/views/main_view.dart';
import 'package:base_structure_project/ui/views/search_screen/search_screen.dart';
import 'package:base_structure_project/ui/views/subsidiary_view/code_receive_screen/code_receive_screen.dart';
import 'package:base_structure_project/ui/views/subsidiary_view/login_screen/login_screen.dart';
import 'package:base_structure_project/ui/views/subsidiary_view/onboarding_screen/onboarding.dart';
import 'package:base_structure_project/ui/views/subsidiary_view/register_screen/register_screen.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';
import 'package:flutter/material.dart';

/// All the Routes for navigating are placed here
class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.loginPath:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutePaths.registerPath:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case RoutePaths.codeReceivePath:
        return MaterialPageRoute(builder: (_) => const CodeReceiveScreen());
      case RoutePaths.mainViewPath:
        return MaterialPageRoute(builder: (_) => const MainView());
      case RoutePaths.searchScreenPath:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

      case RoutePaths.onBoardingPath:
        return MaterialPageRoute(builder: (_) => const OnBoarding());

      /// this commented code is for when we need to pass data to our destination path and
      /// getting the data from settings.arguments
      // case RoutePaths.testScreenPath:
      //   var test = settings.arguments as TestModel;
      //   return MaterialPageRoute(builder: (_) => TestScreen(test: test,));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: TextView(
                      text: 'No route defined for ${settings.name}',
                      size: 16,
                    ),
                  ),
                ));
    }
  }
}
