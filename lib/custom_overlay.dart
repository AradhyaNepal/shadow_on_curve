import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOverlay extends StatelessWidget {
  final Widget child;
  final Color color;

  const CustomOverlay({
    super.key,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:  SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: child,
    );
  }
}