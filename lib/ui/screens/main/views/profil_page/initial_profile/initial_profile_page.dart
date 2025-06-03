import 'package:burla_xatun/cubits/user_data/user_data_cubit.dart';
import 'package:burla_xatun/ui/screens/main/views/profil_page/initial_profile/widgets/delete_profile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../utils/constants/color_constants.dart';
import '../../../../../../utils/extensions/num_extensions.dart';
import 'widgets/log_out_button.dart';
import 'widgets/my_profile_box.dart';
import 'widgets/profile_page_sections.dart';
import 'widgets/profile_picture_and_name.dart';
import 'widgets/profile_pregnancy_box.dart';

class InitialProfilePage extends StatelessWidget {
  const InitialProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final mainCubit = context.read<MainnCubit>();
    final userData = context.read<UserDataCubit>().getUserData();
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldColor,
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
                  12.h,
                  DeleteProfileButton(),
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
