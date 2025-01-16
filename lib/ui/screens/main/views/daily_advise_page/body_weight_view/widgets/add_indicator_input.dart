import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_text.dart';

class AddIndicatorInput extends StatelessWidget {
  const AddIndicatorInput({
    super.key,
    required this.inputName,
    required this.hintText,
  });

  final String inputName;
  final String hintText;

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
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 20) + EdgeInsets.symmetric(vertical: 15),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              color: Color(0xff595959),
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(34)),
              borderSide: BorderSide(
                color: ColorConstants.enabledInputColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(34)),
              borderSide: BorderSide(
                color: ColorConstants.primaryColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorConstants.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
