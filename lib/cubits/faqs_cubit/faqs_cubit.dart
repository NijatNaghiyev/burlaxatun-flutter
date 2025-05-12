import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/faqs_contractor.dart';
import '../../data/models/remote/response/faqs_model.dart';

part 'faqs_state.dart';

class FaqsCubit extends Cubit<FaqsState> {
  FaqsCubit(this._faqsContractor) : super(FaqsState.initial());

  final FaqsContractor _faqsContractor;

  Future<void> getFaqs() async {
    try {
      emit(state.copyWith(status: FaqsStatus.loading));

      final response = await _faqsContractor.getFaqs();

      emit(state.copyWith(
        status: FaqsStatus.success,
        response: response,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        status: FaqsStatus.networkError,
        errorMessage: e.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FaqsStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
