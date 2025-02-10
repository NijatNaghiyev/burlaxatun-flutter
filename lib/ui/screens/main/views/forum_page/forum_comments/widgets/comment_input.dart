import 'dart:developer';

import 'package:burla_xatun/cubits/main_cubit/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../cubits/main_cubit/mainn_cubit.dart';
import '../../../../../../../utils/constants/color_constants.dart';
import '../../../../../../../utils/extensions/context_extensions.dart';

class CommentInput extends StatefulWidget {
  const CommentInput({super.key});

  @override
  State<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  late MainnCubit mainCubit;

  @override
  void initState() {
    mainCubit = context.read<MainnCubit>();
    mainCubit.commentInputTextController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    mainCubit.commentInputTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                child: BlocBuilder<MainnCubit, MainInitial>(
                  buildWhen: (previous, current) {
                    return previous.userTag != current.userTag;
                  },
                  builder: (context, state) {
                    log(mainCubit.commentInputTextController.text);
                    return TextFormField(
                      controller: mainCubit.commentInputTextController,
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
                    );
                  },
                ),
              ),
              SizedBox(width: 11),
              GestureDetector(
                onTap: () {
                  mainCubit.commentInputFocusNode.requestFocus();
                },
                child: SvgPicture.asset('assets/icons/edit_text_icon.svg'),
              ),
              SizedBox(width: 16),
              SvgPicture.asset('assets/icons/send_text_icon.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
