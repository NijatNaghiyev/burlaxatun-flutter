import 'package:flutter/material.dart';

import '../../../../../widgets/global_text.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;

  const DescriptionWidget({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalText(
      height: 1.6,
      textAlign: TextAlign.left,
      text: description,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }
}
