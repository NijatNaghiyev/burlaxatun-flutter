part of 'faqs_cubit.dart';

enum FaqsStatus { initial, loading, success, failure, networkError }

final class FaqsState extends Equatable {
  const FaqsState({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final FaqsStatus status;
  final FaqsResponse? response;
  final String? errorMessage;

  FaqsState copyWith({
    FaqsStatus? status,
    FaqsResponse? response,
    String? errorMessage,
  }) {
    return FaqsState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory FaqsState.initial() => const FaqsState(
        status: FaqsStatus.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
