import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CurveCustomPainter extends CustomPainter {
  final double curveStartHeight;
  final double shadowHeight;
  final Color curveColor;
  final Color shadowColor;

  CurveCustomPainter({
    required this.curveStartHeight,
    required this.shadowHeight,
    required this.curveColor,
    required this.shadowColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawCurve(size, canvas, shadowHeight, shadowColor);
    _drawCurve(size, canvas, 0, curveColor);
  }

  double _startingOfTheCurve(Size size) => size.height-curveStartHeight;

  void _drawCurve(Size size, Canvas canvas, double height, Color color,[Shader? shader]) {
    final curveStartY = _startingOfTheCurve(size) + height;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, curveStartY);
    path.quadraticBezierTo(
        size.width / 2, size.height + height, 0, curveStartY);
    path.lineTo(0, 0);
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.fill
      ..shader = shader
    );
  }

  @override
  bool shouldRepaint(covariant CurveCustomPainter oldDelegate) {
    return oldDelegate.curveStartHeight != curveStartHeight ||
        oldDelegate.curveColor != curveColor ||
        oldDelegate.shadowHeight != shadowHeight ||
        shadowColor != shadowColor;
  }
}
