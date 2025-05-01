import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../utils/extensions/num_extensions.dart';
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
          child: Padding(
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
                        PrivacyPolicyHeader(),
                        LastEditText(),
                        PrivacyPolicyTitle(),
                        PrivacyPolicyDescription(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
