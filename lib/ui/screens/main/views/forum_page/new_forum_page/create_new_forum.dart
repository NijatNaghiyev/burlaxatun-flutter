// import 'package:burla_xatun/ui/screens/main/views/forum_page/new_forum_page/widgets/forum_thoughts_input.dart';
// import 'package:burla_xatun/utils/extensions/num_extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// import 'widgets/new_forum_appbar.dart';
//
// class CreateNewForum extends StatelessWidget {
//   const CreateNewForum({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: NewForumAppbar(
//         onTap: () {
//           context.pop();
//         },
//         send: () {},
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Column(
//             children: [
//               22.h,
//               // ForumTitleInput(),
//               // 32.h,
//               ForumThoughtsInput(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:burla_xatun/cubits/forum_create/forum_create_cubit.dart';
import 'package:burla_xatun/ui/screens/main/views/forum_page/new_forum_page/widgets/forum_thoughts_input.dart';
import 'package:burla_xatun/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'widgets/new_forum_appbar.dart';

class CreateNewForum extends StatefulWidget {
  const CreateNewForum({super.key});

  @override
  State<CreateNewForum> createState() => _CreateNewForumState();
}

class _CreateNewForumState extends State<CreateNewForum> {
  final TextEditingController _textController = TextEditingController();

  late final int categoryId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final params = GoRouterState.of(context).uri.queryParameters;
    categoryId = int.tryParse(params['categoryId'] ?? '') ?? 0;
  }

  void _sendForum() {
    final text = _textController.text.trim();

    if (text.isEmpty) return;

    context.read<ForumCreateCubit>().createForum(
          category: categoryId,
          text: text,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForumCreateCubit, ForumCreateState>(
      listener: (context, state) {
        if (state.status == ForumCreateStatus.success) {
          context.pop();
        } else if (state.status == ForumCreateStatus.failure ||
            state.status == ForumCreateStatus.networkError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Forum əlavə edilərkən xəta baş verdi')),
          );
        }
      },
      child: Scaffold(
        appBar: NewForumAppbar(
          onTap: () => context.pop(),
          send: _sendForum,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                22.h,
                ForumThoughtsInput(controller: _textController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
