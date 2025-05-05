part of 'about_cubit.dart';

enum AboutStatus { initial, loading, success, failure, networkError }

final class AboutState extends Equatable {
  const AboutState({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final AboutStatus status;
  final AboutResponse? response;
  final String? errorMessage;

  AboutState copyWith({
    AboutStatus? status,
    AboutResponse? response,
    String? errorMessage,
  }) {
    return AboutState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory AboutState.initial() => const AboutState(
        status: AboutStatus.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
