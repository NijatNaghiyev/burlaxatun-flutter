import 'package:burla_xatun/cubits/daily_rec/daily_rec_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../../../widgets/global_text.dart';

class HomePageDailyAdvise extends StatelessWidget {
  const HomePageDailyAdvise({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: BlocBuilder<DailyRecCubit, DailyRecState>(
        builder: (_, state) {
          if (state.status == DailyRecStatus.loading) {
            return const Center(child: CustomCircularProgressIndicator());
          }

          if (state.status == DailyRecStatus.failure) {
            return const Center(child: Text('ERROR'));
          }

          if (state.status == DailyRecStatus.networkError) {
            return const Center(child: Text('Network error'));
          }

          if (state.status == DailyRecStatus.success) {
            final data = state.response?.results?.first;
            final cleanImageUrl =
                (data?.image ?? '').replaceAll('\n', '').trim();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  26.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GlobalText(
                        textAlign: TextAlign.left,
                        text: 'Gündəlik Tövsiyyələr · ${data?.day ?? '0'} Gün',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff8C8A8A),
                      ),
                    ],
                  ),
                  17.h,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: cleanImageUrl.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: cleanImageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.broken_image, size: 100),
                          )
                        : Image.asset(
                            'assets/images/default_image.png',
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          ),
                  ),
                  16.h,
                  GlobalText(
                    textAlign: TextAlign.left,
                    text: data?.name ?? '',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  11.h,
                  GlobalText(
                    height: 1.3,
                    maxLines: 8,
                    textAlign: TextAlign.left,
                    text: data?.text ?? '',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff969BAB),
                  ),
                  16.h,
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
