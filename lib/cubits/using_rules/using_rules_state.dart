part of 'using_rules_cubit.dart';

enum UsingRulesStatus { initial, loading, success, failure, networkError }

final class UsingRulesState extends Equatable {
  const UsingRulesState({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final UsingRulesStatus status;
  final UsingRulesResponse? response;
  final String? errorMessage;

  UsingRulesState copyWith({
    UsingRulesStatus? status,
    UsingRulesResponse? response,
    String? errorMessage,
  }) {
    return UsingRulesState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory UsingRulesState.initial() => const UsingRulesState(
        status: UsingRulesStatus.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
