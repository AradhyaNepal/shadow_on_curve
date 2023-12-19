import 'package:curve_bg_shadowed/curve_custom_paint.dart';
import 'package:curve_bg_shadowed/custom_overlay.dart';
import 'package:flutter/material.dart';

class CurveScreen extends StatelessWidget {
  const CurveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Colors.blue.shade100;
    return CustomOverlay(
      color: color,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: CurveCustomPainter(
                        curveStartHeight: 40,
                        shadowHeight: 2,
                        curveColor: color,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                      ),
                      child: const SizedBox.expand(),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
