import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/shared/text.dart';
import 'package:base_structure_project/ui/widgets/button/icon_button.dart';
import 'package:base_structure_project/ui/widgets/custom_modal.dart';
import 'package:base_structure_project/ui/widgets/custom_tappable_listTile.dart';
import 'package:base_structure_project/ui/widgets/views/main_view/profile_screen/profile_exit_to_app.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          CustomTappableListTile(
            title: exitText,
            icon: const ExitToAppIcon(),
            onTap: () {
              showModal(context, width);
            },
          ),
        ],
      ),
    );
  }

  void showModal(BuildContext context, width) {
    showModalBottomSheet(
        backgroundColor: transparent,
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return const CustomModal(
            child: ProfileExitToApp(),
          );
        });
  }
}
