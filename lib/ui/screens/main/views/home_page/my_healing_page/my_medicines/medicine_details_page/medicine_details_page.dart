import 'package:burla_xatun/ui/screens/main/views/home_page/my_healing_page/my_medicines/medicine_details_page/widgets/edit_details_button.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../widgets/global_appbar.dart';
import 'widgets/medicine_detail_box.dart';

class MedicineDetailsPage extends StatelessWidget {
  const MedicineDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Dərmanlarım',
        onTap: () => context.pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20) +
            EdgeInsets.only(top: 33),
        child: Column(
          children: [
            MedicineDetailBox(),
            31.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                EditDetailsButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
