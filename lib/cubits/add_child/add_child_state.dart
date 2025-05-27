part of 'add_child_cubit.dart';

class AddChildState extends Equatable {
  const AddChildState({
    this.addChildStatus = AddChildStatus.initial,
  });

  final AddChildStatus addChildStatus;

  @override
  List<Object?> get props => [
        addChildStatus,
      ];

  AddChildState copyWith({
    AddChildStatus? addChildStatus,
  }) {
    return AddChildState(
      addChildStatus: addChildStatus ?? this.addChildStatus,
    );
  }
}
