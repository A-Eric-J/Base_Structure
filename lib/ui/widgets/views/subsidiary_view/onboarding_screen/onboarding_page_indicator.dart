import 'dart:math';

import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/shared/colors.dart';

class OnBoardingPageIndicator extends StatelessWidget {
  final int currentPage;
  final Widget child;

  const OnBoardingPageIndicator({
    super.key,
    required this.currentPage,
    required this.child,
  });

  Color _getPageIndicatorColor(int pageIndex) {
    return currentPage > pageIndex ? brandOrangeColor : white.withOpacity(0.25);
  }

  double get indicatorLength => pi / 2;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return CustomPaint(
      painter: _OnBoardingPageIndicatorPainter(
        height: height,
        color: _getPageIndicatorColor(0),
        startAngle: (4 * indicatorLength) - indicatorLength,
        indicatorLength: indicatorLength,
      ),
      child: CustomPaint(
        painter: _OnBoardingPageIndicatorPainter(
          height: height,
          color: _getPageIndicatorColor(1),
          startAngle: 4 * indicatorLength,
          indicatorLength: indicatorLength,
        ),
        child: CustomPaint(
          painter: _OnBoardingPageIndicatorPainter(
            height: height,
            color: _getPageIndicatorColor(2),
            startAngle: (4 * indicatorLength) + indicatorLength,
            indicatorLength: indicatorLength,
          ),
          child: child,
        ),
      ),
    );
  }
}

class _OnBoardingPageIndicatorPainter extends CustomPainter {
  final Color color;
  final double startAngle;
  final double indicatorLength;
  final double height;

  const _OnBoardingPageIndicatorPainter({
    required this.height,
    required this.color,
    required this.startAngle,
    required this.indicatorLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = (height > 1000 ? 4.0 : 2.5);

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: height < 500
            ? (size.shortestSide - 4.0) / 2
            : height > 1000
                ? (size.shortestSide + 16.0) / 2
                : (size.shortestSide + 12.0) / 2,
      ),
      startAngle,
      indicatorLength,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_OnBoardingPageIndicatorPainter oldDelegate) {
    return color != oldDelegate.color || startAngle != oldDelegate.startAngle;
  }
}
