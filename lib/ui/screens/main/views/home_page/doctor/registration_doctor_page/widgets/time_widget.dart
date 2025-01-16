import 'package:flutter/material.dart';

import 'time_box.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

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
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(27)),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (_, i) {
                return TimeBox(time: '11:00');
              },
              separatorBuilder: (_, i) {
                return SizedBox(width: 4);
              },
            ),
          ),
        ),
      ),
    );
  }
}
