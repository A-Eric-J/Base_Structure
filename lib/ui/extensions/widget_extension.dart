import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/widgets/animation/custom_loading.dart';
import 'package:flutter/material.dart';

/// This widget extension is for when you have [ViewState.busy] and you want a busy layer on your screen
extension BusyLayer on Widget {
  Widget withBusyOverlay(bool isBusy,
      {bool withOpacity = true, double height = double.maxFinite}) {
    return Stack(
      children: [
        this,
        if (isBusy)
          Container(
            width: double.maxFinite,
            height: height,
            color: withOpacity ? Colors.black45 : Colors.transparent,
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: white.withOpacity(withOpacity ? 0.7 : 1.0),
                  ),
                  padding: const EdgeInsets.all(32),
                  child: const SizedBox(
                    width: 40,
                    height: 40,
                    child: CustomLoading(
                      /// you can add what color you want
                      colors: [black],
                    ),
                  )),
            ),
          ),
      ],
    );
  }
}
