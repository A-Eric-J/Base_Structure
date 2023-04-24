import 'package:base_structure_project/enums/gradient_type.dart';
import 'package:base_structure_project/ui/shared/text.dart';
import 'package:base_structure_project/ui/widgets/gradient.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      requestToServer();
    });
  }

  void requestToServer({bool isRefresh = false}) async {
    /// put your own api service request here
  }

  @override
  Widget build(BuildContext context) {
    return const MainGradient(
      gradientType: GradientType.homeScreen,
      child: Center(
        child: TextView(text: homeScreenText, size: 20),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
