import 'package:burla_xatun/ui/screens/main/views/profie_page/terms_of_use/widgets/last_version_text.dart';
import 'package:burla_xatun/ui/screens/main/views/profie_page/terms_of_use/widgets/terms_of_use_description.dart';
import 'package:burla_xatun/ui/screens/main/views/profie_page/terms_of_use/widgets/terms_of_use_header_text.dart';
import 'package:burla_xatun/ui/screens/main/views/profie_page/terms_of_use/widgets/terms_of_use_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../widgets/global_appbar.dart';
import '../widgets/text_board_widget.dart';

class TermsOfUseView extends StatelessWidget {
  const TermsOfUseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: 'İstifade Qaydalari',
        onTap: () {
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 19, horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 20,
                      children: [
                        TermsOfUseHeaderText(),
                        LastVersionText(),
                        TermsOfUseTitle(),
                        TermsOfUseDescription(),
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
