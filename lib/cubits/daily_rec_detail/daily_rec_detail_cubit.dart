import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/daily_rec_detail_contractor.dart';
import '../../data/models/remote/response/daily_rec_detail_model.dart';

part 'daily_rec_detail_state.dart';

class DailyRecDetailCubit extends Cubit<DailyRecDetailState> {
  DailyRecDetailCubit(this._dailyRecDetailContractor)
      : super(DailyRecDetailState.initial());

  final DailyRecDetailContractor _dailyRecDetailContractor;

  Future<void> getDailyRecDetail(String slug) async {
    try {
      emit(state.copyWith(status: DailyRecDetailStatus.loading));

      final response =
          await _dailyRecDetailContractor.getDailyRecDetail(slug: slug);

      emit(state.copyWith(
        status: DailyRecDetailStatus.success,
        response: response,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        status: DailyRecDetailStatus.networkError,
        errorMessage: e.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DailyRecDetailStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
