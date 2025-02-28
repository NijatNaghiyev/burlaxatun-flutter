import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../utils/constants/color_constants.dart';

class SelectedNameTile extends StatelessWidget {
  const SelectedNameTile({super.key, required this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name!),
      trailing: GestureDetector(
        onTap: () {},
        child: SvgPicture.asset(
          'assets/icons/favorite_icon.svg',
          colorFilter: ColorFilter.mode(
            ColorConstants.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
