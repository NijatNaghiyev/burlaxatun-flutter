import 'package:flutter/material.dart';

class AppSnackbars {
  AppSnackbars._();

  static void _snackBar(
    BuildContext context, {
    required String message,
    Color color = Colors.green,
  }) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: color,
        ),
      );
  }

  static void error(
    BuildContext context,
    String message,
  ) {
    _snackBar(
      context,
      message: message,
      color: Colors.red,
    );
  }

  static void success(
    BuildContext context,
    String message,
  ) {
    _snackBar(
      context,
      message: message,
    );
  }
}
