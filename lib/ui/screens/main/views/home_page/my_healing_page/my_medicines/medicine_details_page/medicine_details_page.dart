import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../widgets/global_appbar.dart';

class MedicineDetailsPage extends StatelessWidget {
  const MedicineDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Dərmanlarım',
        onTap: () => context.pop(),
      ),
      body: Center(
        child: Text('details medicine'),
      ),
    );
  }
}
