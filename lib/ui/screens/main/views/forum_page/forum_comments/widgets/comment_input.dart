import 'package:burla_xatun/cubits/main/mainn_cubit.dart';
import 'package:burla_xatun/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../utils/constants/color_constants.dart';

class CommentInput extends StatelessWidget {
  const CommentInput({super.key});
  

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return ColoredBox(
      color: Colors.white,
      child: SizedBox(
        height: 89,
        width: context.deviceWidth,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1,
                color: Colors.grey,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 274,
                height: 43,
                child: TextFormField(
                  focusNode: mainCubit.commentInputFocusNode,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(245, 245, 245, 1),
                    contentPadding: EdgeInsets.only(left: 16),
                    hintText: 'Mesajinizi qeyd edin',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Color(0xff595959),
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: ColorConstants.enabledInputColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 11),
              SvgPicture.asset('assets/icons/edit_text_icon.svg'),
              SizedBox(width: 16),
              SvgPicture.asset('assets/icons/send_text_icon.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
