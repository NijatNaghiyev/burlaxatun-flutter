import 'package:flutter/material.dart';

import 'category_box.dart';

class DoctorCategories extends StatelessWidget {
  const DoctorCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (_, i) {
          return Row(
            children: [
              i == 0 ? SizedBox(width: 15) : SizedBox.shrink(),
              CategoryBox(doctorCategory: 'Ginekolog'),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 10);
        },
      ),
    );
  }
}
