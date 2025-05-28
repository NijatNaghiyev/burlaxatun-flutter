import 'package:burla_xatun/cubits/questions_cubit/questions_cubit.dart';
import 'package:burla_xatun/cubits/questions_cubit/questions_state.dart';
import 'package:burla_xatun/ui/widgets/global_text.dart';
import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:burla_xatun/utils/extensions/context_extensions.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateOrTimeBox extends StatelessWidget {
  const DateOrTimeBox({
    super.key,
    required this.onTap,
    required this.inputName,
    required this.hintText,
  });

  final void Function() onTap;
  final String inputName;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GlobalText(
              text: inputName,
              fontSize: 14,
              height: 1.1,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ],
        ),
        16.h,
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: context.deviceWidth,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(34)),
                border: Border.all(
                  color: ColorConstants.enabledInputColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16) +
                    EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    SizedBox(width: 12),
                    GlobalText(
                      text: hintText,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.textFieldTitleColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
