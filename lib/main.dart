import 'package:base_structure_project/base/provider_setup.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:base_structure_project/generated/l10n.dart';
import 'package:base_structure_project/locator.dart';
import 'package:base_structure_project/services/navigation_service.dart';
import 'package:base_structure_project/services/shared_preference_service/shared_preference.dart';
import 'package:base_structure_project/ui/extensions/help_methods.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/views/subsidiary_view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_structure_project/base/router.dart' as router;
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await SharedPreference.init();
  return runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    preCacheImages(context);
    return MaterialApp(
      localizationsDelegates:  const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      builder: (context, widget) {
        return MediaQuery(
          ///this line to make app font size independent from device settings
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, widget!),
              maxWidth: 480,
              minWidth: 480,
              breakpoints: [
                const ResponsiveBreakpoint.resize(480, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
              background: Container(color: white)),
        );
      },
      onGenerateRoute: router.Router.generateRoute,
      debugShowCheckedModeBanner: true,
      navigatorKey: locator<NavigationService>().navigatorKey,
      home:  const SplashScreen(),
    );
  }

}
