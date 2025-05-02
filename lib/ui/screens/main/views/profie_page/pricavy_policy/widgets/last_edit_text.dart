import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastEditText extends StatelessWidget {
  final String lastEditText;

  const LastEditText({
    super.key,
    required this.lastEditText,
  });

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat("d MMMM y").format(date);
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = _formatDate(lastEditText);

    if (formattedDate.isEmpty) return const SizedBox.shrink();

    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400,
        ),
        children: [
          const TextSpan(
            text: 'Sonuncu düzəliş : ',
          ),
          TextSpan(
            text: formattedDate,
          ),
        ],
      ),
    );
  }
}
