import 'package:flutter/material.dart';

extension NumExtensions on num {
  Widget get h => SizedBox(height: toDouble());
  Widget get w => SizedBox(height: toDouble());
}