import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../cubits/main/main_state.dart';
import '../../../../../../../cubits/main/mainn_cubit.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_text.dart';

class ProfilePregnancyBox extends StatelessWidget {
  const ProfilePregnancyBox({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GlobalText(
                    text: 'Hamiləlik',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ],
              ),
              32.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalText(
                    text: 'Körpənin cinsi',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                  GlobalText(
                    text: 'Qiz',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                ],
              ),
              14.h,
              ColoredBox(
                color: Color(0xffF2F4F7),
                child: SizedBox(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              14.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalText(
                    text: 'Körpənin adi',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                  GlobalText(
                    text: 'Daxil edin',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff98A2B3),
                  ),
                ],
              ),
              14.h,
              ColoredBox(
                color: Color(0xffF2F4F7),
                child: SizedBox(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              14.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalText(
                    text: 'Dogum tarixi',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                  GlobalText(
                    text: '03.12.2024',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                ],
              ),
              14.h,
              ColoredBox(
                color: Color(0xffF2F4F7),
                child: SizedBox(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              14.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalText(
                    text: 'Doğum tarixini hesabla',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                  SvgPicture.asset('assets/icons/arrow_right.svg'),
                ],
              ),
              14.h,
              ColoredBox(
                color: Color(0xffF2F4F7),
                child: SizedBox(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              14.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalText(
                    text: 'İlk uşaqdır?',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                  SizedBox(
                    width: 45,
                    height: 27.35,
                    child: BlocBuilder<MainnCubit, MainInitial>(
                      buildWhen: (previous, current) {
                        return previous.isFirstChild != current.isFirstChild;
                      },
                      builder: (context, state) {
                        return CupertinoSwitch(
                          dragStartBehavior: DragStartBehavior.down,
                          value: state.isFirstChild,
                          onChanged: (v) {
                            mainCubit.firstChildToggle(v);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              14.h,
              ColoredBox(
                color: Color(0xffF2F4F7),
                child: SizedBox(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              14.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalText(
                    text: 'Dölünüz düşübmü?',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                  SizedBox(
                    width: 45,
                    height: 27.35,
                    child: CupertinoSwitch(
                      dragStartBehavior: DragStartBehavior.down,
                      value: false,
                      onChanged: (v) {},
                    ),
                  ),
                ],
              ),
              14.h,
              ColoredBox(
                color: Color(0xffF2F4F7),
                child: SizedBox(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              14.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalText(
                    text: 'Körpəniz doğulubmu artıq?',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff344054),
                  ),
                  SizedBox(
                    width: 45,
                    height: 27.35,
                    child: CupertinoSwitch(
                      dragStartBehavior: DragStartBehavior.down,
                      value: false,
                      onChanged: (v) {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
