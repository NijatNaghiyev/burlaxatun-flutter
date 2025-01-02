import 'package:burla_xatun/ui/screens/main/views/home_page/home/widgets/baby_information.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/home/widgets/home_page_boxes.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/home/widgets/home_page_daily_advise.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/home/widgets/pregnancy_guide.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/extensions/num_extensions.dart';
import 'widgets/home_page_appbar.dart';
import 'widgets/horizontal_calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppbar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              24.h,
              HorizontalCalendar(),
              24.h,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 24,
                  children: [
                    BabyInformation(),
                    HomePageDailyAdvise(),
                    PregnancyGuide(),
                    HomePageBoxes(),
                  ],
                ),
              ),
              24.h,
            ],
          ),
        ),
      ),
    );
  }
}
