import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../../../../widgets/global_text.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final mainCubit = context.read<MainnCubit>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GlobalText(
                text: 'Doğuşdan sonra bərpa',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              GestureDetector(
                onTap: () => context.push('/see_all'),
                child: GlobalText(
                  text: 'Ətraflı',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        12.h,
        SizedBox(
          height: 175,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, i) {
              return Row(
                children: [
                  SizedBox(width: i == 0 ? 15 : 12),
                  GestureDetector(
                    onTap: () => context.push('/article_details'),
                    child: SizedBox(
                      width: 146,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xffE4C0ED),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Image.asset(
                                  'assets/png/postnatal_saglamlig.png'),
                            ),
                            2.h,
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 9, right: 9, bottom: 5),
                              child: GlobalText(
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                height: 1.3,
                                text:
                                    'Doğuşdan Sonra Emosional və Fiziki Dəyişikliklər',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            // separatorBuilder: (BuildContext context, int index) {
            //   return SizedBox(width: 12);
            // },
          ),
        ),
      ],
    );
  }
}
