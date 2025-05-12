import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../cubits/splash/splash_cubit.dart';
import '../../../utils/constants/color_constants.dart';
import '../../widgets/global_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashCubit splashCubit;

  @override
  void initState() {
    splashCubit = context.read<SplashCubit>();
    splashCubit.splahsMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryRedColor,
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashAuth) {
            // onboardinge baxilib yoxsa yox burada yoxlanilmalidir.
            context.go('/onboarding');
          } else if (state is SplashSuccess) {
            context.go('/home');
          } else if (state is SplashLogin) {
            context.go('/login');
          }
        },
        child: Center(
          child: GlobalText(
            text: 'Burla Xatun',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
