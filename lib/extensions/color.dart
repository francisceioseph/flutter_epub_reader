import 'package:flutter/material.dart';

extension ColorExtension on Color {
  toHexString() {
    var code = value.toRadixString(16).substring(2);
    return "#$code";
  }
}
