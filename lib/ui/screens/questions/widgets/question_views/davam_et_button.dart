import 'package:flutter/material.dart';

import '../../../../../utils/constants/color_constants.dart';
import '../../../../../utils/constants/padding_constants.dart';
import '../../../../widgets/global_button.dart';

class DavamEt extends StatelessWidget {
  const DavamEt({
    super.key,
    this.isActive = false,
    this.onPressed,
  });

  final bool isActive;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.h20,
      child: GlobalButton(
        buttonName: 'Davam et',
        buttonColor: isActive ? ColorConstants.primaryRedColor : Colors.black38,
        textColor: Colors.white,
        onPressed: isActive ? onPressed : null,
      ),
    );
  }
}
