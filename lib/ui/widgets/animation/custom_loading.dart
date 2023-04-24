import 'package:base_structure_project/ui/widgets/animation/decorate.dart';
import 'package:flutter/material.dart';

/// Entrance of the loading.
class CustomLoading extends StatelessWidget {
  /// Indicate which type.

  /// The color you draw on the shape.
  final List<Color>? colors;
  final Color? backgroundColor;

  /// The stroke width of line.
  final double? strokeWidth;

  /// Applicable to which has cut edge of the shape
  final Color? pathBackgroundColor;

  const CustomLoading({
    Key? key,
    this.colors,
    this.backgroundColor,
    this.strokeWidth,
    this.pathBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color>? safeColors = colors == null || colors!.isEmpty
        ? [Theme.of(context).primaryColor]
        : colors;
    return DecorateContext(
      decorateData: DecorateData(
        colors: safeColors!,
        strokeWidth: strokeWidth,
        pathBackgroundColor: pathBackgroundColor,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          color: backgroundColor,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
