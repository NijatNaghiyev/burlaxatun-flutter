import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/blog_cat_contractor.dart';
import '../../data/models/remote/response/blog_cat_model.dart';

part 'blog_cat_state.dart';

class BlogCatCubit extends Cubit<BlogCatState> {
  BlogCatCubit(this._blogCatContractor) : super(BlogCatState.initial());

  final BlogCatContractor _blogCatContractor;

  Future<void> getBlogCat() async {
    try {
      emit(state.copyWith(status: BlogCatStatus.loading));

      final response = await _blogCatContractor.getBlogCat();

      emit(state.copyWith(
        status: BlogCatStatus.success,
        response: response,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        status: BlogCatStatus.networkError,
        errorMessage: e.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BlogCatStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
