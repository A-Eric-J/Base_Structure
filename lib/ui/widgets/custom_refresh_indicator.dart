import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/shared/colors.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Function onRefresh;

  const CustomRefreshIndicator(
      {Key? key, required this.child, required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: brandMainColor,
        displacement: 20.0,
        onRefresh: onRefresh(),
        child: child);
  }
}
