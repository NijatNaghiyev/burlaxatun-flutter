import 'package:burla_xatun/ui/screens/main/views/daily_advise_page/widgets/advise_image.dart';
import 'package:burla_xatun/ui/screens/main/views/daily_advise_page/widgets/advise_text.dart';
import 'package:burla_xatun/ui/screens/main/views/daily_advise_page/widgets/advise_title.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/widgets/scrollable_days_appbar.dart';
import 'package:burla_xatun/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/daily_rec/daily_rec_cubit.dart';
import '../../../../../utils/extensions/num_extensions.dart';

class AdvicePage extends StatefulWidget {
  const AdvicePage({super.key});

  @override
  State<AdvicePage> createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  @override
  void initState() {
    super.initState();
    context.read<DailyRecCubit>().getDailyRec();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyRecCubit, DailyRecState>(
      builder: (context, state) {
        switch (state.status) {
          case DailyRecStatus.loading:
            return const Scaffold(
              body: Center(child: CustomCircularProgressIndicator()),
            );

          case DailyRecStatus.failure:
            return const Scaffold(
              body: Center(child: Text('Xəta baş verdi')),
            );

          case DailyRecStatus.networkError:
            return const Scaffold(
              body: Center(child: Text('Şəbəkə xətası')),
            );

          case DailyRecStatus.success:
            final results = state.response?.results ?? [];

            return Scaffold(
              appBar: ScrollableDaysAppbar(
                appbarName: 'Günlük Tövsiyələr',
                day: results.first.day ?? 1,
              ),
              body: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemCount: results.length,
                separatorBuilder: (_, __) => 24.h,
                itemBuilder: (context, index) {
                  final item = results[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.image != null && item.image!.isNotEmpty)
                        AdviseImage(imageUrl: item.image!),
                      12.h,
                      AdviseTitle(adviceTitle: item.name ?? ''),
                      10.h,
                      AdviseText(adviceText: item.text ?? ''),
                    ],
                  );
                },
              ),
            );

          default:
            return const Scaffold(
              body: SizedBox.shrink(),
            );
        }
      },
    );
  }
}
