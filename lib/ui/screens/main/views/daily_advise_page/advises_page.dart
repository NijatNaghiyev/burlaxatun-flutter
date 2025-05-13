import 'package:burla_xatun/cubits/daily_rec_detail/daily_rec_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/extensions/context_extensions.dart';
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
                              child: Text('image'),
                            ),
                          ),
                        ),

                        // SizedBox(
                        //   height: 148,
                        //   width: context.deviceWidth,
                        //   child: ClipRRect(
                        //     borderRadius: BorderRadius.circular(8),
                        //     child: (data?.image != null &&
                        //             data!.image!.isNotEmpty)
                        //         ? (data.image!.toLowerCase().endsWith('.svg')
                        //             ? SvgPicture.network(
                        //                 data.image!,
                        //                 fit: BoxFit.cover,
                        //                 placeholderBuilder: (context) =>
                        //                     const Center(
                        //                         child:
                        //                             CircularProgressIndicator()),
                        //               )
                        //             : Image.network(
                        //                 data.image!,
                        //                 fit: BoxFit.cover,
                        //                 errorBuilder:
                        //                     (context, error, stackTrace) {
                        //                   return Container(
                        //                     color: Colors.black12,
                        //                     child: const Center(
                        //                       child: Text('Şəkil yüklənmədi'),
                        //                     ),
                        //                   );
                        //                 },
                        //               ))
                        //         : Container(
                        //             color: Colors.black12,
                        //             child: const Center(
                        //               child: Text('Şəkil yoxdur'),
                        //             ),
                        //           ),
                        //   ),
                        // ),

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
