import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> showCustomDatePicker({
  required BuildContext context,
  required TextEditingController controller,
  String format = 'dd.MM.yyyy',
}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    helpText: 'Tarix seçin',
    locale: const Locale('az'),
  );

  if (picked != null) {
    final formatted = DateFormat(format).format(picked);
    controller.text = formatted;
  }
}
