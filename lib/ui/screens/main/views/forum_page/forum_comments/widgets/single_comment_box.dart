import 'package:burla_xatun/ui/screens/main/views/forum_page/forum_comments/widgets/comment_datas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../cubits/main/main_state.dart';
import '../../../../../../../cubits/main/mainn_cubit.dart';
import '../../../../../../../utils/extensions/context_extensions.dart';

class SingleCommentBox extends StatelessWidget {
  const SingleCommentBox({super.key, required this.i});

  final int i;

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainnCubit>();
    return GestureDetector(
      onLongPressStart: (details) {
        double fromTop = details.globalPosition.dy - 132;
        mainCubit.showMenuDialogAndEmojis(context, fromTop);
        mainCubit.updateCommentBoxIndex(i);
      },
      child: BlocBuilder<MainnCubit, MainInitial>(
        buildWhen: (previous, current) {
          return previous.commentBoxIndex != current.commentBoxIndex;
        },
        builder: (context, state) {
          return Material(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color:
                i == state.commentBoxIndex ? Color(0xffFCE4EC) : Colors.white,
            child: SizedBox(
              width: context.deviceWidth,
              child: Ink(
                child: DecoratedBox(
                  decoration: BoxDecoration(
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
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: CommentDatas(),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
