part of 'user_data_cubit.dart';

enum UserDataStatus { initial, loading, success, failure, networkError }

final class UserDataState extends Equatable {
  const UserDataState({
    required this.status,
    required this.response,
    required this.errorMessage,
  });

  final UserDataStatus status;
  final UserDataResponse? response;
  final String? errorMessage;

  UserDataState copyWith({
    UserDataStatus? status,
    UserDataResponse? response,
    String? errorMessage,
  }) {
    return UserDataState(
      status: status ?? this.status,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory UserDataState.initial() => const UserDataState(
        status: UserDataStatus.initial,
        response: null,
        errorMessage: null,
      );

  @override
  List<Object?> get props => [status, response, errorMessage];
}
