import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/about_contractor.dart';
import '../../data/models/remote/response/about_model.dart';

part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit(this._aboutContractor) : super(AboutState.initial());

  final AboutContractor _aboutContractor;

  Future<void> getAbout() async {
    try {
      emit(state.copyWith(status: AboutStatus.loading));

      final response = await _aboutContractor.getAbout();

      emit(state.copyWith(
        status: AboutStatus.success,
        response: response,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        status: AboutStatus.networkError,
        errorMessage: e.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AboutStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
