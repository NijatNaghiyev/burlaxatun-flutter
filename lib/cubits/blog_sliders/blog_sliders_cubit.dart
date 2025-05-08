import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/blog_sliders_contractor.dart';
import '../../data/models/remote/response/blog_sliders_model.dart';

part 'blog_sliders_state.dart';

class BlogSlidersCubit extends Cubit<BlogSlidersState> {
  BlogSlidersCubit(this._blogSlidersContractor)
      : super(BlogSlidersState.initial());

  final BlogSlidersContractor _blogSlidersContractor;

  Future<void> getBlogSliders() async {
    try {
      emit(state.copyWith(status: BlogSlidersStatus.loading));

      final response = await _blogSlidersContractor.getBlogSliders();

      emit(state.copyWith(
        status: BlogSlidersStatus.success,
        response: response,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        status: BlogSlidersStatus.networkError,
        errorMessage: e.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BlogSlidersStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
