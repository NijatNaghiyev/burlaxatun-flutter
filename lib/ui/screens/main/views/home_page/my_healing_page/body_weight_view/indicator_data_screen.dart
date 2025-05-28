import 'package:burla_xatun/cubits/indicator/indicator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_appbar.dart';
import 'widgets/chart_widget.dart';
import 'widgets/calendar_and_add_buttons.dart';
import 'widgets/time_intervals_widget.dart';

class IndicatorDataScreen extends StatefulWidget {
  const IndicatorDataScreen({
    super.key,
    required this.indicatorName,
  });

  final String indicatorName;

  @override
  State<IndicatorDataScreen> createState() => _IndicatorDataScreenState();
}

class _IndicatorDataScreenState extends State<IndicatorDataScreen> {
  late IndicatorCubit indicatorCubit;
  @override
  void initState() {
    indicatorCubit = context.read<IndicatorCubit>()
      ..getIndicatorDatas(
        indicatorName: widget.indicatorName,
        range: 'monthly',
      );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Bədən çəkisi',
        onLeadingTap: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TimeIntervalsWidget(indicatorName: widget.indicatorName),
            18.h,
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: BlocBuilder<IndicatorCubit, IndicatorState>(
                buildWhen: (previous, current) {
                  return current.indicatorList != null;
                },
                builder: (context, state) {
                  if (state.indicatorStatus == IndicatorStatus.loading) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 112),
                      child:
                          Center(child: CircularProgressIndicator.adaptive()),
                    );
                  } else if (state.indicatorStatus == IndicatorStatus.error) {
                    return Center(child: Text('Error occured'));
                  }
                  if (state.indicatorStatus == IndicatorStatus.success) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ChartWidget(
                        indicatorDataList: state.indicatorList ?? [],
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
            27.h,
            CalendarAndAddButtons(indicatorName: widget.indicatorName),
          ],
        ),
      ),
    );
  }
}
