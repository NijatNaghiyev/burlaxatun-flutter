import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../widgets/global_text.dart';

class AddIndicatorInput extends StatelessWidget {
  const AddIndicatorInput({
    super.key,
    required this.inputName,
    required this.hintText,
    this.controller,
    this.onTap,
  });

  final String inputName;
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
        TextFormField(
          controller: controller,
          readOnly: onTap != null,
          onTap: onTap,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 20, top: 15, bottom: 15),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xff595959),
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(34)),
              borderSide: BorderSide(
                color: ColorConstants.enabledInputColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(34)),
              borderSide: BorderSide(
                color: ColorConstants.primaryRedColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorConstants.primaryRedColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
