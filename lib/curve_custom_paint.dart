import 'package:flutter/material.dart';

class CurveCustomPainter extends CustomPainter {
  final double curveStartHeight;
  final double shadowHeight;
  final Color curveColor;
  final Color shadowColor;
  final double blurRadius;

  CurveCustomPainter({
    required this.curveStartHeight,
    required this.shadowHeight,
    required this.curveColor,
    required this.shadowColor,
    required this.blurRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawShadow(size, canvas,);
   _drawBackground(size, canvas);
  }

  void _drawBackground(Size size, Canvas canvas) {
    final curveStartY = _startingOfTheCurve(size)+shadowHeight/2;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, curveStartY);
    path.quadraticBezierTo(size.width / 2, size.height, 0, curveStartY);
    path.lineTo(0, 0);
    canvas.drawPath(
      path,
      Paint()
        ..color = curveColor
        ..style = PaintingStyle.fill,
    );
  }

  void _drawShadow(
    Size size,
    Canvas canvas,
  ) {
    final start=_startingOfTheCurve(size);
    final shadowPath = Path();
    shadowPath.moveTo(0, start-shadowHeight);
    shadowPath.quadraticBezierTo(size.width / 2, size.height, size.width, start-shadowHeight);
    shadowPath.lineTo(size.width, start+shadowHeight);
    shadowPath.quadraticBezierTo(size.width / 2, size.height+shadowHeight, 0, start+shadowHeight);


    canvas.drawShadow(
      shadowPath,
      shadowColor,
      blurRadius,
      true,
    );
  }

  double _startingOfTheCurve(Size size) => size.height - curveStartHeight;

  @override
  bool shouldRepaint(covariant CurveCustomPainter oldDelegate) {
    return oldDelegate.curveStartHeight != curveStartHeight ||
        oldDelegate.curveColor != curveColor ||
        oldDelegate.shadowHeight != shadowHeight ||
        oldDelegate.shadowColor != shadowColor ||
        oldDelegate.blurRadius != blurRadius;
  }
}


