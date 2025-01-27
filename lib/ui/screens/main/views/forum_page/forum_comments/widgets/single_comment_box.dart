import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../utils/extensions/context_extensions.dart';
import '../../../../../../widgets/global_text.dart';

class SingleCommentBox extends StatelessWidget {
  const SingleCommentBox({super.key, required this.i});

  final int i;

  @override
  Widget build(BuildContext context) {
    // final mainCubit = context.read<MainnCubit>();
    return GestureDetector(
      onTapUp: (details) {
        log('tapped up');
        log('this is tapped position: ${details.globalPosition}');
        // showMenu(
        //   shape: Border.all(color: Colors.black),
        //   menuPadding: EdgeInsets.all(0),
        //   context: context,
        //   position: RelativeRect.fromLTRB(
        //     details.globalPosition.dx,
        //     details.globalPosition.dy,
        //     context.deviceWidth - details.globalPosition.dx,
        //     context.deviceWidth - details.globalPosition.dy,
        //   ),
        //   items: <PopupMenuEntry>[
        //     PopupMenuItem(child: Text('Kopyala')),
        //     PopupMenuItem(child: Text('Cavabla')),
        //     PopupMenuItem(child: Text('Sil')),
        //   ],
        // );

        // overlay
      },
      child: CupertinoContextMenu.builder(
        actions: [
          CupertinoContextMenuAction(
            child: GlobalText(
              text: 'Kopyala',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          CupertinoContextMenuAction(
            child: GlobalText(
              text: 'Cavabla',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          CupertinoContextMenuAction(
            isDestructiveAction: true,
            child: GlobalText(
              text: 'Sil',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
            onPressed: () {
              context.pop();
            },
          ),
        ],
        builder: (BuildContext context, Animation<double> animation) {
          return SizedBox(
            width: context.deviceWidth,
            height: 100,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.amber,
                border: i == 0
                    ? null
                    : Border(
                        top: BorderSide(
                          width: 2,
                          color: Color(0xffE4E7EC),
                        ),
                      ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          );
        },
      ),
    );
  }
}
