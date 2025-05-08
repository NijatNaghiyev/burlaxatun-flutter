import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractor/contact_contractor.dart';
import '../../data/models/remote/response/contact_model.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit(this._contactContractor) : super(ContactState.initial());

  final ContactContractor _contactContractor;

  Future<void> getContact() async {
    try {
      emit(state.copyWith(status: ContactStatus.loading));

      final response = await _contactContractor.getContact();

      emit(state.copyWith(
        status: ContactStatus.success,
        response: response,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        status: ContactStatus.networkError,
        errorMessage: e.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ContactStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
