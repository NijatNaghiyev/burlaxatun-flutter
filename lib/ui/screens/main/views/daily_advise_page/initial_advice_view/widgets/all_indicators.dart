import 'package:burla_xatun/ui/screens/main/views/daily_advise_page/initial_advice_view/widgets/single_indicator_tile.dart';
import 'package:flutter/material.dart';

class AllIndicators extends StatelessWidget {
  const AllIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 16; i++) SingleIndicatorTile(),
      ],
    );
  }
}
