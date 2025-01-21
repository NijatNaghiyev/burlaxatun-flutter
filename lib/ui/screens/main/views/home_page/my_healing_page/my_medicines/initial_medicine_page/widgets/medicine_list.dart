import '../../../../../../../../../utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import 'single_medicine_tile.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.84,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (_, i) {
          return Center(
            child: Column(
              children: [
                SingleMedicineTile(),
                10.h,
              ],
            ),
          );
        },
      ),
    );
  }
}
