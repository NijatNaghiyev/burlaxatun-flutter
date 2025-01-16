import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../widgets/global_text.dart';

class SingleIndicatorTile extends StatelessWidget {
  const SingleIndicatorTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () {
          context.push('/body_weight');
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 48,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/body_weight_icon.svg'),
                SizedBox(width: 16),
                GlobalText(
                  text: 'Bədən çəkisi',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                Spacer(),
                SvgPicture.asset('assets/icons/arrow_right.svg'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
