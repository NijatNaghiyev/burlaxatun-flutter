import 'package:burla_xatun/cubits/main_cubit/mainn_cubit.dart';
import 'package:burla_xatun/data/services/local/login_token_service.dart';
import 'package:burla_xatun/utils/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../widgets/global_text.dart';

class LogOutButton extends StatefulWidget {
  const LogOutButton({super.key});

  @override
  State<LogOutButton> createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {
  bool isLoading = false;

  void _logOut() async {
    isLoading = true;
    setState(() {});
    await locator<LoginTokenService>().deleteSaveByKey("login");
  }

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return GestureDetector(
      onTap: () {
        _logOut();
        Future.delayed(Duration(seconds: 1), () {
          context.go('/login');
          mainCubit.changeView(0);
        });
      },
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Color(0xffFEE4E2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: isLoading
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 153, vertical: 15),
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Row(
                    children: [
                      SvgPicture.asset('assets/icons/log_out_icon.svg'),
                      SizedBox(width: 21),
                      GlobalText(
                        text: 'Çıxış',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffF04438),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        'assets/icons/log_out_arrow_icon.svg',
                        colorFilter: ColorFilter.mode(
                          Color(0xffF04438),
                          BlendMode.dstIn,
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
