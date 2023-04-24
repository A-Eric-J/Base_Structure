import 'package:flutter/material.dart';
import 'package:base_structure_project/const_values/route_paths.dart';
import 'package:base_structure_project/locator.dart';
import 'package:base_structure_project/services/navigation_service.dart';
import 'package:base_structure_project/services/shared_preference_service/shared_preference.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/shared/text.dart';
import 'package:base_structure_project/ui/widgets/views/subsidiary_view/onboarding_screen/header.dart';
import 'package:base_structure_project/ui/widgets/views/subsidiary_view/onboarding_screen/next_page_button.dart';
import 'package:base_structure_project/ui/widgets/views/subsidiary_view/onboarding_screen/onboarding_page_indicator.dart';
import 'package:base_structure_project/ui/widgets/views/subsidiary_view/onboarding_screen/text_column.dart';
import 'pages/onboarding_page.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 1;

  bool get isFirstPage => _currentPage == 1;

  Widget _getPage() {
    switch (_currentPage) {
      case 1:
        return const OnBoardingPage(
          number: 1,
          textColumn: TextColumn(
              title: firstOnBoardingPageTitleText,
              text: firstOnBoardingPageDesText),
        );
      case 2:
        return const OnBoardingPage(
          number: 2,
          textColumn: TextColumn(
              title: secondOnBoardingPageTitleText,
              text: secondOnBoardingPageDesText),
        );
      case 3:
        return const OnBoardingPage(
          number: 3,
          textColumn: TextColumn(
              title: thirdOnBoardingPageTitleText,
              text: thirdOnBoardingPageDesText),
        );
      default:
        throw Exception("Page with number '$_currentPage' does not exist.");
    }
  }

  void _setNextPage(int nextPageNumber) {
    setState(() {
      _currentPage = nextPageNumber;
    });
  }

  void _nextPage() {
    switch (_currentPage) {
      case 1:
        _setNextPage(2);
        break;
      case 2:
        _setNextPage(3);
        break;
      case 3:
        _goToLogin();
        break;
    }
  }

  void _prePage() {
    switch (_currentPage) {
      case 3:
        _setNextPage(2);
        break;
      case 2:
        _setNextPage(1);
        break;
      case 1:
        break;
    }
  }

  void _goToLogin() {
    SharedPreference.setHasOnBoardingPage(false);
    locator<NavigationService>()
        .navigateTo(RoutePaths.loginPath, pushReplacement: true);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: width * 0.04,
              left: width * 0.06,
              right: width * 0.06,
              bottom: width * 0.05),
          child: Column(
            children: [
              Header(
                onBack: _prePage,
                pageNumber: _currentPage,
              ),
              Expanded(child: _getPage()),
              OnBoardingPageIndicator(
                currentPage: _currentPage,
                child: NextPageButton(onPressed: _nextPage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
