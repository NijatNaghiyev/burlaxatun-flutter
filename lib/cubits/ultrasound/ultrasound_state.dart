part of 'ultrasound_cubit.dart';

class UltrasoundState extends Equatable {
  const UltrasoundState({
    this.ultraSoundStatus = UltraSoundStatus.initial,
    this.ultrasound,
  });

  final UltraSoundStatus ultraSoundStatus;
  final UltrasoundModel? ultrasound;

  @override
  List<Object?> get props => [
        ultraSoundStatus,
        ultrasound,
      ];

  UltrasoundState copyWith({
    UltraSoundStatus? ultraSoundStatus,
    UltrasoundModel? ultrasound,
  }) {
    return UltrasoundState(
      ultraSoundStatus: ultraSoundStatus ?? this.ultraSoundStatus,
      ultrasound: ultrasound ?? this.ultrasound,
    );
  }
}
