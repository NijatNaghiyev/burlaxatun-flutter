part of 'baby_names2_cubit.dart';

enum BabyNamesStatus2 { initial, loading, success, failure, networkError }

final class BabyNamesState2 extends Equatable {
  const BabyNamesState2({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final BabyNamesStatus2 status;
  final BabyNamesResponse2? response;
  final String? errorMessage;

  BabyNamesState2 copyWith({
    BabyNamesStatus2? status,
    BabyNamesResponse2? response,
    String? errorMessage,
  }) {
    return BabyNamesState2(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory BabyNamesState2.initial() => const BabyNamesState2(
        status: BabyNamesStatus2.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
