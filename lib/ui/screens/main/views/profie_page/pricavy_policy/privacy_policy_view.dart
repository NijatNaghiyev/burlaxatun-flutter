import 'package:burla_xatun/cubits/privacy_policy/privacy_policy_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../../widgets/global_appbar.dart';
import '../widgets/text_board_widget.dart';
import 'widgets/last_edit_text.dart';
import 'widgets/privacy_policy_description.dart';
import 'widgets/privacy_policy_header.dart';
import 'widgets/privacy_policy_title.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'Mexvilik siyaseti',
        onLeadingTap: () {
          context.pop();
        },
      ),
      body: Center(
        child: SingleChildScrollView(
          child: BlocBuilder<PrivacyPolicyCubit, PrivacyPolicyState>(
            builder: (_, state) {
              if (state.status == PrivacyPolicyStatus.loading) {
                return Center(
                  child: CustomCircularProgressIndicator(
                    isWhite: false,
                  ),
                );
              }

              if (state.status == PrivacyPolicyStatus.failure) {
                return Center(
                  child: Text('Error'),
                );
              }

              if (state.status == PrivacyPolicyStatus.networkError) {
                return Center(
                  child: Text('Network error'),
                );
              }

              if (state.status == PrivacyPolicyStatus.success) {
                final data = state.response?.results ?? [];
                final result = data.isNotEmpty ? data[0] : null;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      24.h,
                      TextBoardWidget(
                        text: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 19, horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 20,
                            children: [
                              PrivacyPolicyHeader(
                                headerTitle: result?.text ?? '',
                              ),
                              LastEditText(
                                lastEditText:
                                    result?.updatedAt?.toLocal().toString() ??
                                        '',
                              ),
                              PrivacyPolicyTitle(
                                title:
                                    result?.updatedAt?.toLocal().toString() ??
                                        '',
                              ),
                              PrivacyPolicyDescription(
                                description: result?.text ?? '',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
