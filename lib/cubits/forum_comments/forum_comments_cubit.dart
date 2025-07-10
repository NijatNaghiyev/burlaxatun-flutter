import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/forum_comments_contractor.dart';
import '../../data/models/remote/response/forum_comments_model.dart';

part 'forum_comments_state.dart';

class ForumCommentsCubit extends Cubit<ForumCommentsState> {
  ForumCommentsCubit(this._forumCommentsContractor)
      : super(ForumCommentsState.initial());

  final ForumCommentsContractor _forumCommentsContractor;

  Future<void> getForumComments() async {
    try {
      emit(state.copyWith(status: ForumCommentsStatus.loading));

      final response = await _forumCommentsContractor.getForumComments();

      emit(state.copyWith(
        status: ForumCommentsStatus.success,
        response: response,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        status: ForumCommentsStatus.networkError,
        errorMessage: e.toString(),
      ));
    } catch (e, stackTrace) {
      emit(state.copyWith(
        status: ForumCommentsStatus.failure,
        errorMessage: e.toString(),
      ));
      debugPrint("Error: $e");
      debugPrint("Stack trace: $stackTrace");
    }
  }
}
