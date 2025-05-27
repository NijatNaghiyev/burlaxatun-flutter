import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../cubits/tasks_by_weeks/tasks_by_weeks_cubit.dart';
import '../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../widgets/global_text.dart';
import 'pregnancy_guide_box.dart';

class PregnancyGuide extends StatefulWidget {
  const PregnancyGuide({super.key});

  @override
  State<PregnancyGuide> createState() => _PregnancyGuideState();
}

class _PregnancyGuideState extends State<PregnancyGuide> {
  late TasksByWeeksCubit _tasksByWeeksCubit;
  @override
  void initState() {
    _tasksByWeeksCubit = context.read<TasksByWeeksCubit>()..getTasksByWeek();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksByWeeksCubit, TasksByWeeksState>(
      builder: (context, state) {
        if (state.tasksByWeekStatus == TasksByWeekStatus.loading) {
          return Center(child: CircularProgressIndicator.adaptive());
        } else if (state.tasksByWeekStatus == TasksByWeekStatus.error) {
          return Center(child: Text('Data not found'));
        } else if (state.tasksByWeekStatus == TasksByWeekStatus.networkError) {
          return Center(child: Text(state.networkErrorMessage!));
        }
        if (state.tasksByWeekStatus == TasksByWeekStatus.success) {
          final weekTask = state.tasksByWeek?.first;
          final tasks = weekTask?.tasks ?? [];
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 26),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GlobalText(
                          textAlign: TextAlign.end,
                          text:
                              'Hamiləlik Bələdçisi · ${weekTask?.week ?? '-'} . Həftə',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff8C8A8A),
                        ),
                      ],
                    ),
                    13.h,
                    tasks.isEmpty
                        ? Text('No tasks have been assigned for this week yet')
                        : Column(
                            spacing: 24,
                            children: [
                              for (int i = 0; i < tasks.length; i++)
                                PregnancyGuideBox(
                                  title: tasks[i].name ?? 'data not found',
                                  description:
                                      tasks[i].text ?? 'data not found',
                                ),
                            ],
                          )
                  ],
                ),
              ),
            ),
          );
        }
        return SizedBox.fromSize();
      },
    );
  }
}
