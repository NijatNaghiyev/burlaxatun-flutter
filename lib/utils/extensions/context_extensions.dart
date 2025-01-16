import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get deviceHeight => MediaQuery.sizeOf(this).height;
  double get deviceWidth => MediaQuery.sizeOf(this).width;
  double get statusBarTopHeight => MediaQuery.of(this).viewPadding.top;
  double get statusBarBottomHeight => MediaQuery.of(this).viewPadding.bottom;
}
