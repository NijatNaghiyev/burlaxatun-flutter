import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../widgets/global_text.dart';
import 'add_indicator_input.dart';

class AddNewIndicatorDialog extends StatelessWidget {
  const AddNewIndicatorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 480,
        child: Material(
          type: MaterialType.transparency,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22, right: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: SvgPicture.asset('assets/icons/close_icon.svg'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                GlobalText(
                  text: 'New indicator',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                30.h,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    spacing: 20,
                    children: [
                      AddIndicatorInput(
                        inputName: 'Bədən çəkisi',
                        hintText: 'Kq',
                      ),
                      AddIndicatorInput(
                        inputName: 'Tarix',
                        hintText: '03/12/2024',
                      ),
                      AddIndicatorInput(
                        inputName: 'Vaxt',
                        hintText: '15:24',
                      ),
                    ],
                  ),
                ),
                20.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 44,
                      width: 140,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shadowColor:
                              const WidgetStatePropertyAll(Colors.transparent),
                          backgroundColor:
                              WidgetStatePropertyAll(Color(0xffECECEC)),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: GlobalText(
                          text: 'Imtina Et',
                          fontSize: 14,
                          height: 1.1,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(width: 22),
                    SizedBox(
                      height: 44,
                      width: 140,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shadowColor:
                              const WidgetStatePropertyAll(Colors.transparent),
                          backgroundColor:
                              WidgetStatePropertyAll(Color(0xffFFD3E2)),
                        ),
                        onPressed: () {},
                        child: GlobalText(
                          text: 'Yadda saxla',
                          fontSize: 14,
                          height: 1.1,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
