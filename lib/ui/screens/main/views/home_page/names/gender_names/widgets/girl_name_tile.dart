import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GirlNameTile extends StatefulWidget {
  const GirlNameTile({
    super.key,
    required this.name,
  });
  final String name;
  @override
  State<GirlNameTile> createState() => _GirlNameTileState();
}

class _GirlNameTileState extends State<GirlNameTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.name),
      trailing: GestureDetector(
        onTap: () async {},
        child: SvgPicture.asset(
          'assets/icons/favorite_icon.svg',
          colorFilter: ColorFilter.mode(
            ColorConstants.hintTextColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
