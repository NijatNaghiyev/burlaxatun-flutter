import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/daily_rec_contractor.dart';
import '../../data/models/remote/response/daily_rec_response.dart';

part 'daily_rec_state.dart';

class DailyRecCubit extends Cubit<DailyRecState> {
  DailyRecCubit(this._dailyRecContractor) : super(DailyRecState.initial());

  final DailyRecContractor _dailyRecContractor;

  Future<void> getDailyRec() async {
    try {
      emit(state.copyWith(status: DailyRecStatus.loading));

      final response = await _dailyRecContractor.getDailyRec();

      emit(state.copyWith(
        status: DailyRecStatus.success,
        response: response,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        status: DailyRecStatus.networkError,
        errorMessage: e.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DailyRecStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
