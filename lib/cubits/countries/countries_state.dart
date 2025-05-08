part of 'countries_cubit.dart';

enum CountriesStatus { initial, loading, success, failure, networkError }

final class CountriesState extends Equatable {
  const CountriesState({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final CountriesStatus status;
  final CountriesResponse? response;
  final String? errorMessage;

  CountriesState copyWith({
    CountriesStatus? status,
    CountriesResponse? response,
    String? errorMessage,
  }) {
    return CountriesState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory CountriesState.initial() => const CountriesState(
        status: CountriesStatus.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
