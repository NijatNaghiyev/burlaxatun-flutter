import 'dart:developer';

import 'package:burla_xatun/data/contractor/forum_list_contractor.dart';
import 'package:burla_xatun/data/models/remote/response/forum_list_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forum_list_state.dart';

class ForumListCubit extends Cubit<ForumListState> {
  ForumListCubit(this._forumListContractor) : super(ForumListInitial());

  final ForumListContractor _forumListContractor;

  Future<void> getForumList({String? categoryId}) async {
    try {
      emit(ForumListLoading());
      log("Forum List Loading");

      final response =
          await _forumListContractor.getForumList(categoryId: categoryId);
      emit(ForumListSuccess(response));
    } on DioException catch (e, s) {
      emit(ForumListNetworkError(e.toString()));
      log("Forum List Network Error: $e", stackTrace: s);
    } catch (e, s) {
      emit(ForumListError(e.toString()));
      log("Forum List Unkown Error: $e", stackTrace: s);
    }
  }
}
