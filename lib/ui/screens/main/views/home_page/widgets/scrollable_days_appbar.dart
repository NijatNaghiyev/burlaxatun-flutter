import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../utils/constants/color_constants.dart';
import '../../../../../../utils/extensions/context_extensions.dart';
import '../../../../../../utils/extensions/num_extensions.dart';
import '../../../../../widgets/global_text.dart';

class ScrollableDaysAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ScrollableDaysAppbar({
    super.key,
    required this.appbarName,
  });

  final String appbarName;

  @override
  Widget build(BuildContext context) {
    // final mainCubit = context.read<MainnCubit>();
    return DecoratedBox(
      decoration: BoxDecoration(
        color: ColorConstants.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: context.statusBarTopHeight + 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: SizedBox(
                      width: 44,
                      height: 44,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back_ios_new_rounded),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: GlobalText(
                      text: appbarName,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            38.h,
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 66,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 50,
                  itemBuilder: (_, i) {
                    return i == 10
                        ? SizedBox(
                            height: 65,
                            width: 42,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0xffBE3362),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: SizedBox(
                                      height: 28,
                                      width: 30,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GlobalText(
                                              text: '$i',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  5.h,
                                  SizedBox(
                                    width: 4,
                                    height: 4,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: GlobalText(
                              text: '$i',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 14);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 175);
}
