import 'dart:io';

import 'package:burla_xatun/cubits/user_data/user_data_cubit.dart';
import 'package:burla_xatun/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_text.dart';

class ProfilePictureAndName extends StatefulWidget {
  const ProfilePictureAndName({super.key});

  @override
  State<ProfilePictureAndName> createState() => _ProfilePictureAndNameState();
}

class _ProfilePictureAndNameState extends State<ProfilePictureAndName> {
  File? imageFile;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (_, state) {
        if (state.status == UserDataStatus.loading) {
          return Center(
            child: CustomCircularProgressIndicator(),
          );
        }
        if (state.status == UserDataStatus.failure) {
          return Center(
            child: Text('Error'),
          );
        }
        if (state.status == UserDataStatus.networkError) {
          return Center(
            child: Text('Network Error'),
          );
        }
        if (state.status == UserDataStatus.success) {
          final data = state.response;
          return Column(
            children: [
              GlobalText(
                text: 'My Profile',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              16.h,
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: imageFile != null
                        ? FileImage(imageFile!) as ImageProvider
                        : null,
                    child: imageFile == null
                        ? Image.network(
                            data?.image ?? 'assets/png/pfp.png',
                            width: 94,
                            height: 94,
                          )
                        : null,
                  ),
                  Positioned(
                    child: GestureDetector(
                      onTap: () async {
                        await pickImage();
                      },
                      child: SizedBox(
                        height: 28,
                        width: 28,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffEC407A),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: SvgPicture.asset(
                              'assets/icons/camera_icon.svg',
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              16.h,
              GlobalText(
                text: data?.fullName ?? 'User',
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
