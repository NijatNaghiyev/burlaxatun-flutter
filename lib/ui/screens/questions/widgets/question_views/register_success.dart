import '../../../../widgets/global_text.dart';
import '../../../../../utils/constants/asset_constants.dart';
import '../../../../../utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterSuccess extends StatelessWidget {
  const RegisterSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColoredBox(
          color: Colors.transparent,
          child: SvgPicture.asset(AssetConstants.successImage),
        ),
        75.h,
        SizedBox(
          width: 318,
          child: GlobalText(
            text: 'Qeydiyyat uğurla tamamlandı!',
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            height: 1.5,
          ),
        )
      ],
    );
  }
}
