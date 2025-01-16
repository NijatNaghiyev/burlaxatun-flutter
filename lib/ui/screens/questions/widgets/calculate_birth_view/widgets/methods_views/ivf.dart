import 'package:flutter/material.dart';

class Ivf extends StatelessWidget {
  const Ivf({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio(
              value: 'injn',
              groupValue: 'inijn',
              onChanged: (v) {},
            ),
            Text('İVF 3 Gün Transfer günü')
          ],
        ),
        Row(
          children: [
            Radio(
              value: 'injn',
              groupValue: 'inijn',
              onChanged: (v) {},
            ),
            Text('İVF 5 Gün Transfer günü')
          ],
        ),
      ],
    );
  }
}
