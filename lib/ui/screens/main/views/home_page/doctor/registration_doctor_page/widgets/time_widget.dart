import 'package:flutter/material.dart';

import 'time_box.dart';

class TimeWidget extends StatelessWidget {
  final List<String> timeList;

  const TimeWidget({super.key, required this.timeList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xffF9FAFB),
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(27)),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: timeList.length,
              itemBuilder: (_, i) {
                return TimeBox(time: timeList[i]);
              },
              separatorBuilder: (_, i) => SizedBox(width: 4),
            ),
          ),
        ),
      ),
    );
  }
}
