import 'package:flutter/material.dart';

import 'single_time_interval_box.dart';

class TimeIntervalsWidget extends StatelessWidget {
  const TimeIntervalsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        SingleTimeIntervalBox(interval: 'Gun'),
        SingleTimeIntervalBox(interval: 'Hefte'),
        SingleTimeIntervalBox(interval: 'Ay'),
        SingleTimeIntervalBox(interval: 'İl'),
      ],
    );
  }
}
