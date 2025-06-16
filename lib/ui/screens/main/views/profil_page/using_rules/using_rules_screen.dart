import 'package:burla_xatun/cubits/using_rules/using_rules_cubit.dart';
import 'package:burla_xatun/ui/screens/main/views/profil_page/widgets/description_widget.dart';
import 'package:burla_xatun/ui/screens/main/views/profil_page/widgets/last_edit_text.dart';
import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../../widgets/global_appbar.dart';
import '../widgets/header_text.dart';
import '../widgets/text_board_widget.dart';

class UsingRulesScreen extends StatelessWidget {
  const UsingRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldColor,
      appBar: GlobalAppbar(
        title: 'İstifade Qaydalari',
        onLeadingTap: () {
          context.pop();
        },
      ),
      body: Center(
        child: SingleChildScrollView(
          child: BlocBuilder<UsingRulesCubit, UsingRulesState>(
            builder: (_, state) {
              if (state.status == UsingRulesStatus.loading) {
                return Center(
                  child: CustomCircularProgressIndicator(
                    isWhite: false,
                  ),
                );
              }

              if (state.status == UsingRulesStatus.failure) {
                return Center(
                  child: Text('Error'),
                );
              }

              if (state.status == UsingRulesStatus.networkError) {
                return Center(
                  child: Text('Network error'),
                );
              }

              if (state.status == UsingRulesStatus.success) {
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
                              HeaderText(
                                title:
                                    '“Burla Xatun” mobil tətbiqindən istifadə qaydaları',
                              ),
                              //LastEditText(),
                              LastEditText(
                                lastEditText:
                                    result?.updatedAt?.toLocal().toString() ??
                                        '',
                              ),
                              DescriptionWidget(
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
