import 'package:flutter/material.dart';

import '../../../../../utils/constants/asset_constants.dart';
import '../../../../../utils/constants/padding_constants.dart';
import '../../../../widgets/global_input.dart';

class AddYourChild extends StatelessWidget {
  const AddYourChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.h20,
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            GlobalInput(
              inputName: 'Tam Ad',
              prefixIcon: 'assetsicon/child_user.svg',
              hintText: 'Tam adını qeyd edin',
            ),
            GlobalInput(
              inputName: 'Dogum Tarixi',
              prefixIcon: AssetConstants.calendarIcon,
              hintText: 'Doğum tarixini qeyd edin',
            ),
            GlobalInput(
              inputName: 'Çəki',
              prefixIcon: AssetConstants.weightIcon,
              hintText: 'Çəkisini qeyd edin',
            ),
            GlobalInput(
              inputName: 'Boy',
              prefixIcon: AssetConstants.heightIcon,
              hintText: 'Boyunu qeyd edin',
            ),
          ],
        ),
      ),
    );
  }
}
