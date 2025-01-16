import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GirlNames extends StatelessWidget {
  const GirlNames({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.65,
        child: ListView.separated(
          itemCount: 20,
          itemBuilder: (_, i) {
            return ListTile(
              title: Text('Girl name'),
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
      ),
    );
  }
}
