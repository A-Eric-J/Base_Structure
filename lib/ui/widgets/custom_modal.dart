import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/shared/colors.dart';

/// [CustomModal] is a custom child of modalBottomSheet that we use in this app
class CustomModal extends StatelessWidget {
  final Widget child;
  final bool shouldScroll;

  const CustomModal({Key? key, required this.child, this.shouldScroll = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(width * 0.0106),
          child: Container(
              width: width * 0.112,
              height: width * 0.016,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(width * 0.016)),
                color: white,
              )),
        ),
        shouldScroll
            ? Expanded(
                child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(width * 0.053),
                          topRight: Radius.circular(width * 0.053)),
                      color: white,
                    ),
                    child: child),
              )
            : Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * 0.053),
                      topRight: Radius.circular(width * 0.053)),
                  color: white,
                ),
                child: child),
      ],
    );
  }
}
