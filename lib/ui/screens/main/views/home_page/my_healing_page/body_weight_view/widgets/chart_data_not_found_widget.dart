import 'package:flutter/material.dart';

class ChartDataNotFoundWidget extends StatelessWidget {
  const ChartDataNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Melumat tapilmadi'),
      ],
    );
  }
}
