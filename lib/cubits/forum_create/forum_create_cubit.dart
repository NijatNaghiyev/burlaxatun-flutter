import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/forum_create_contractor.dart';

part 'forum_create_state.dart';

class ForumCreateCubit extends Cubit<ForumCreateState> {
  ForumCreateCubit(this._forumCreateContractor)
      : super(const ForumCreateState(status: ForumCreateStatus.initial));

  final ForumCreateContractor _forumCreateContractor;

  Future<void> createForum({
    required int category,
    required String text,
  }) async {
    try {
      emit(state.copyWith(status: ForumCreateStatus.loading));
      log("Forum create loading");

      final response = await _forumCreateContractor.createForum(
        category: category,
        text: text,
      );

      if (response) {
        emit(state.copyWith(status: ForumCreateStatus.success));
        log('Forum create success');
        return;
      }
    } on DioException catch (e, s) {
      emit(state.copyWith(status: ForumCreateStatus.networkError));
      log("Forum create DioException: $e", stackTrace: s);
    } catch (e, s) {
      emit(state.copyWith(status: ForumCreateStatus.failure));
      log("Forum create unknown error: $e", stackTrace: s);
    }
  }
}
