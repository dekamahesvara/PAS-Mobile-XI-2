import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class iconApp extends StatelessWidget {
  const iconApp({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/app_logo.svg',
      width: width * 0.05,
      height: height * 0.05,
    );
  }
}
