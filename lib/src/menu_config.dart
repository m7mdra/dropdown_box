library dropdown_box;

import 'package:flutter/material.dart';

class MenuConfig {
  final ShapeBorder shape;
  final Color color;
  final double elevation;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final double distanceFromBox;
  final Color shadowColor;
  final Color surfaceTintColor;

  const MenuConfig({
    this.distanceFromBox = 8,
    this.shape = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16))),
    this.color = Colors.black12,
    this.elevation = 0,
    this.titleTextStyle = const TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    this.subtitleTextStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black54,
    ),
    this.shadowColor = Colors.black38,
    this.surfaceTintColor = Colors.transparent,
  });
}
