library dropdown_box;

import 'package:flutter/material.dart';

class BoxConfig {
  final TextStyle? boxTextStyle;
  final Color color;
  final BorderRadius borderRadius;
  final EdgeInsets padding;

  const BoxConfig({
    this.boxTextStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    this.padding = const EdgeInsets.all(16),
    this.color = Colors.black12,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  });
}
