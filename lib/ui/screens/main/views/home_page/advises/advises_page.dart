import 'package:burla_xatun/ui/screens/main/views/home_page/advises/widgets/advise_text.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/advises/widgets/advise_title.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/extensions/context_extensions.dart';
import '../../../../../../utils/extensions/num_extensions.dart';
import '../widgets/scrollable_days_appbar.dart';

class AdvisesPage extends StatelessWidget {
  const AdvisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollableDaysAppbar(
        appbarName: 'Gündəlik tövsiyyələr',
      ),
      body: Padding(
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
                        color: Color(0xffF5F5F5),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Center(
                      child: Text('image'),
                    ),
                  ),
                ),
                20.h,
                AdviseTitle(),
                20.h,
                AdviseText(),
                20.h,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
