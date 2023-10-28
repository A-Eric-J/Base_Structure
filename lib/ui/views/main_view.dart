import 'package:base_structure_project/providers/main_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/shared/text.dart';
import 'package:base_structure_project/ui/views/main_view/screens/home_screen/home_screen.dart';
import 'package:base_structure_project/ui/views/main_view/screens/my_order_screen/my_order_screen.dart';
import 'package:base_structure_project/ui/views/main_view/screens/profile_screen/profile_screen.dart';
import 'package:base_structure_project/ui/widgets/buttom_navigation_item.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Consumer<MainScreenProvider>(
              builder: (context, mainScreenProvider, child) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              onVerticalDragStart: (details) =>
                  FocusScope.of(context).requestFocus(FocusNode()),
              child: _fragment(mainScreenProvider.bottomNavigationCounter),
            );
          }),
        ),
        bottomNavigationBar: Consumer<MainScreenProvider>(
            builder: (context, bottomNavigation, child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: white,
            currentIndex: bottomNavigation.bottomNavigationCounter,
            onTap: bottomNavigation.setBottomNavigationCounter,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            iconSize: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  activeIcon: BottomNavigationItem(
                      label: homeScreenText,
                      activated: true,
                      iconData: Icons.home),
                  icon: BottomNavigationItem(
                    /*
                    Flutter 3.3.10 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 135454af32 (11 months ago) • 2022-12-15 07:36:55 -0800
Engine • revision 3316dd8728
Tools • Dart 2.18.6 • DevTools 2.15.0

                     */
                      label: homeScreenText,
                      activated: false,
                      iconData: Icons.home),
                  label: homeScreenText),
              BottomNavigationBarItem(
                  activeIcon: BottomNavigationItem(
                      label: myOrderScreenText,
                      activated: true,
                      iconData: Icons.list_alt),
                  icon: BottomNavigationItem(
                      label: myOrderScreenText,
                      activated: false,
                      iconData: Icons.list_alt),
                  label: myOrderScreenText),
              BottomNavigationBarItem(
                  activeIcon: BottomNavigationItem(
                      label: profileScreenText,
                      activated: true,
                      iconData: Icons.person),
                  icon: BottomNavigationItem(
                      label: profileScreenText,
                      activated: false,
                      iconData: Icons.person),
                  label: profileScreenText),
            ],
          );
        }));
  }

  Widget _fragment(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const MyOrderScreen();
      case 2:
        return const ProfileScreen();
    }
    return Container();
  }
}
