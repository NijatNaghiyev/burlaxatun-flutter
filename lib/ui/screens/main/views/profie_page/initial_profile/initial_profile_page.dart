import 'widgets/log_out_button.dart';
import 'widgets/my_profile_box.dart';
import 'widgets/profile_pregnancy_box.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/extensions/num_extensions.dart';
import 'widgets/profile_page_sections.dart';
import 'widgets/profile_picture_and_name.dart';

class InitialProfilePage extends StatelessWidget {
  const InitialProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final mainCubit = context.read<MainnCubit>();
    return Scaffold(
      backgroundColor: Color(0xffF7F8FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  24.h,
                  ProfilePictureAndName(),
                  24.h,
                  ProfilePageSections(),
                  12.h,
                  ProfilePregnancyBox(),
                  12.h,
                  MyProfileBox(),
                  12.h,
                  ColoredBox(
                    color: Color(0xffE8E8E8),
                    child: SizedBox(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  12.h,
                  LogOutButton(),
                  24.h,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
