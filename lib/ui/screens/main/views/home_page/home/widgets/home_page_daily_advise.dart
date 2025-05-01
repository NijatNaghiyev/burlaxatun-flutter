import 'package:burla_xatun/cubits/daily_rec/daily_rec_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../../../widgets/global_text.dart';

class HomePageDailyAdvise extends StatelessWidget {
  const HomePageDailyAdvise({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: BlocBuilder<DailyRecCubit, DailyRecState>(
        builder: (_, state) {
          if (state.status == DailyRecStatus.loading) {
            return const Center(
              child: CustomCircularProgressIndicator(),
            );
          }

          if (state.status == DailyRecStatus.failure) {
            return Center(
              child: Text('ERROR'),
            );
          }

          if (state.status == DailyRecStatus.networkError) {
            return Center(
              child: Text('Network error'),
            );
          }
          if (state.status == DailyRecStatus.success) {
            final data = state.response?.results?.first;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                child: Column(
                  children: [
                    26.h,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GlobalText(
                          textAlign: TextAlign.left,
                          text:
                              'Gündəlik Tövsiyyələr · ${data?.day ?? '0'} Gün',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff8C8A8A),
                        ),
                      ],
                    ),
                    17.h,
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                      ),
                      child: data?.image != null
                          ? SvgPicture.network(
                              data!.image!,
                              fit: BoxFit.cover,
                            )
                          : SvgPicture.asset(
                              'assets/svg/advise_image.svg',
                              fit: BoxFit.cover,
                            ),
                    ),
                    16.h,
                    GlobalText(
                      textAlign: TextAlign.left,
                      text: data?.name ??
                          'Dırnaqlarınıza dırnaq boyası çəkmək olarmı, yoxsa yox?',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    11.h,
                    GlobalText(
                      height: 1.3,
                      maxLines: 8,
                      textAlign: TextAlign.left,
                      text: data?.text ??
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff969BAB),
                    ),
                    16.h,
                  ],
                ),
              ),
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
