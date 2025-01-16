import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArticleImage extends StatelessWidget {
  const ArticleImage({
    super.key,
    this.playButton,
  });

  final Widget? playButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xffE4C0ED),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.asset(
              'assets/png/postnatal.png',
              height: 180,
              width: 180,
            ),
            playButton != null
                ? SizedBox(
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
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
