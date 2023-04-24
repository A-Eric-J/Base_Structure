import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/shared/colors.dart';

/// [popUpWidgetBuilder] is for showing popUp
popUpWidgetBuilder(Widget child, dynamic onBackgroundTap) {
  return OverlayEntry(
    builder: (context) => Material(
      color: Colors.transparent,
      child: Stack(children: [
        GestureDetector(
            onTap: onBackgroundTap,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: primaryDark.withOpacity(0.8),
            )),
        child,
      ]),
    ),
  );
}
