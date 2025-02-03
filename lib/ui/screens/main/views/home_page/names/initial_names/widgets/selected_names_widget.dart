import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../utils/constants/color_constants.dart';

class SelectedNamesWidget extends StatelessWidget {
  const SelectedNamesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 20,
        itemBuilder: (_, i) {
          return ListTile(
            title: Text('Favorite name'),
            trailing: SvgPicture.asset(
              'assets/icons/favorite_icon.svg',
              colorFilter: ColorFilter.mode(
                ColorConstants.primaryColor,
                BlendMode.dstIn,
              ),
            ),
            onTap: () {},
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Color(0xffDADADA),
          );
        },
      ),
    );
  }
}
