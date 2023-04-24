import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

/// We use Shimmer in [WidgetInBusyState] for showing that, this widget is in busy state

class WidgetInBusyState extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Color? baseColor;
  final Color? highlightColor;

  const WidgetInBusyState(
      {Key? key,
      this.height,
      this.width,
      this.radius,
      this.baseColor,
      this.highlightColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? 0.0),
        ),
        child: Shimmer(
          color: baseColor ?? firstShimmerColor!,
          colorOpacity: 0.3,
          duration: const Duration(seconds: 4),
          child: Container(
            color: secondShimmerColor,
            width: width,
            height: height,
          ),
        ));
  }
}
