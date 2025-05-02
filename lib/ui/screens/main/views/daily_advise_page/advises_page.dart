import 'package:burla_xatun/cubits/daily_rec_detail/daily_rec_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../utils/extensions/context_extensions.dart';
import '../../../../../utils/extensions/num_extensions.dart';
import '../../../../widgets/custom_circular_progress_indicator.dart';
import '../home_page/widgets/scrollable_days_appbar.dart';
import 'widgets/advise_text.dart';
import 'widgets/advise_title.dart';

class AdvisesPage extends StatefulWidget {
  const AdvisesPage({super.key});

  @override
  State<AdvisesPage> createState() => _AdvisesPageState();
}

class _AdvisesPageState extends State<AdvisesPage> {
  late final String slug;

  @override
  void initState() {
    super.initState();
    final extra = GoRouterState.of(context).extra;
    slug = (extra as Map<String, dynamic>)['slug'] as String;
    context.read<DailyRecDetailCubit>().getDailyRecDetail(slug);
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
                        SizedBox(
                          height: 148,
                          width: context.deviceWidth,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              border: Border.all(
                                color: const Color(0xffF5F5F5),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                                child: Text(
                                    'image')), // buranı real şəkil ilə əvəz edə bilərsən
                          ),
                        ),
                        20.h,
                        AdviseTitle(adviceTitle: data?.name ?? ''),
                        20.h,
                        AdviseText(adviceText: data?.text ?? ''),
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
