import 'package:burla_xatun/cubits/daily_rec_detail/daily_rec_detail_cubit.dart';
import 'package:burla_xatun/ui/screens/main/views/daily_advise_page/widgets/advise_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/extensions/num_extensions.dart';
import '../../../../widgets/custom_circular_progress_indicator.dart';
import '../home_page/widgets/scrollable_days_appbar.dart';
import 'widgets/advise_text.dart';
import 'widgets/advise_title.dart';

class AdvisesPage extends StatefulWidget {
  final String? slug;

  const AdvisesPage({
    super.key,
    this.slug,
  });

  @override
  State<AdvisesPage> createState() => _AdvisesPageState();
}

class _AdvisesPageState extends State<AdvisesPage> {
  @override
  void initState() {
    super.initState();
    //context.read<DailyRecDetailCubit>().getDailyRecDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollableDaysAppbar(
        appbarName: 'Gündəlik tövsiyyələr',
      ),
      body: BlocBuilder<DailyRecDetailCubit, DailyRecDetailState>(
        builder: (_, state) {
          switch (state.status) {
            case DailyRecDetailStatus.loading:
              return const Center(child: CustomCircularProgressIndicator());

            case DailyRecDetailStatus.failure:
              return const Center(child: Text('Xəta baş verdi'));

            case DailyRecDetailStatus.networkError:
              return const Center(child: Text('Şəbəkə xətası'));

            case DailyRecDetailStatus.success:
              final data = state.response;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        26.h,
                        AdviseImage(
                          imageUrl: 'assets/png/banner.png',
                        ),
                        20.h,
                        AdviseTitle(adviceTitle: data?.name ?? ''),
                        20.h,
                        AdviseText(
                          adviceText: data?.text ?? '',
                        ),
                        20.h,
                      ],
                    ),
                  ),
                ),
              );

            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
