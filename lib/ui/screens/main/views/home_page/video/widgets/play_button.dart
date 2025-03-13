import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 44,
        height: 44,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/play_icon.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
