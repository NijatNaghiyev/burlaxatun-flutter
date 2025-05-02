import 'package:burla_xatun/cubits/faqs_cubit/faqs_cubit.dart';
import 'package:burla_xatun/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../widgets/global_appbar.dart';
import 'widgets/question_box.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F8FA),
      appBar: GlobalAppbar(
        title: 'Tez-tez verilən suallar',
        onLeadingTap: () {
          context.pop();
        },
      ),
      body: BlocBuilder<FaqsCubit, FaqsState>(
        builder: (_, state) {
          if (state.status == FaqsStatus.loading) {
            return Center(
              child: CustomCircularProgressIndicator(
                isWhite: false,
              ),
            );
          }

          if (state.status == FaqsStatus.failure) {
            return Center(
              child: Text('Error'),
            );
          }

          if (state.status == FaqsStatus.networkError) {
            return Center(
              child: Text('Network error'),
            );
          }

          if (state.status == FaqsStatus.success) {
            final results = state.response?.results ?? [];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < results.length; i++)
                      Column(
                        children: [
                          QuestionBox(
                            index: i,
                            faq: results[i],
                          ),
                          // Pass the FAQ item to QuestionBox
                          SizedBox(height: 20),
                        ],
                      ),
                  ],
                ),
              ),
            );
          }

          return SizedBox.shrink(); // If none of the statuses are matched
        },
      ),
    );
  }
}
