import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_appbar.dart';
import 'widgets/body_weight_chart.dart';
import 'widgets/calendar_and_add_buttons.dart';
import 'widgets/time_intervals_widget.dart';

class BodyWeightPage extends StatelessWidget {
  const BodyWeightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Bədən çəkisi',
        onTap: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TimeIntervalsWidget(),
            18.h,
            BodyWeightChart(),
            27.h,
            CalendarAndAddButtons(),
          ],
        ),
      ),
    );
  }
}
