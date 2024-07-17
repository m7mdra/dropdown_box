library dropdown_box;

import 'package:flutter/foundation.dart';

class DropdownBoxItem<T> {
  final String label;
  final String? subtitle;
  final T? value;
  final Key? key;

  DropdownBoxItem({required this.label, this.subtitle, this.value, this.key});
}
