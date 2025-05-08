part of 'privacy_policy_cubit.dart';

enum PrivacyPolicyStatus { initial, loading, success, failure, networkError }

final class PrivacyPolicyState extends Equatable {
  const PrivacyPolicyState({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final PrivacyPolicyStatus status;
  final PrivacyPolicyResponse? response;
  final String? errorMessage;

  PrivacyPolicyState copyWith({
    PrivacyPolicyStatus? status,
    PrivacyPolicyResponse? response,
    String? errorMessage,
  }) {
    return PrivacyPolicyState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory PrivacyPolicyState.initial() => const PrivacyPolicyState(
        status: PrivacyPolicyStatus.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
