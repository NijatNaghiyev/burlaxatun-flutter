part of 'contact_cubit.dart';

enum ContactStatus { initial, loading, success, failure, networkError }

final class ContactState extends Equatable {
  const ContactState({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final ContactStatus status;
  final ContactResponse? response;
  final String? errorMessage;

  ContactState copyWith({
    ContactStatus? status,
    ContactResponse? response,
    String? errorMessage,
  }) {
    return ContactState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory ContactState.initial() => const ContactState(
        status: ContactStatus.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
