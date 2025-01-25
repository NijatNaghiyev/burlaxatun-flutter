import 'package:burla_xatun/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/asset_constants.dart';
import '../../../../widgets/global_input.dart';
import '../../../../widgets/global_text.dart';

class AddYourChild extends StatelessWidget {
  const AddYourChild({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ColoredBox(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Column(
            spacing: context.deviceHeight < 700 ? 15 : 20,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: context.deviceHeight < 710 ? 14 : 28),
                child: GlobalText(
                  text: 'Övladınızı əlavə edin',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
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
      ),
    );
  }
}
