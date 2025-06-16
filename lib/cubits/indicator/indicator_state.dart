part of 'indicator_cubit.dart';

class IndicatorState extends Equatable {
  const IndicatorState({
    this.indicatorStatus = IndicatorStatus.initial,
    this.indicatorList,
  });

  final IndicatorStatus indicatorStatus;
  final List<IndicatorModel>? indicatorList;

  @override
  List<Object?> get props => [
        indicatorStatus,
        indicatorList,
      ];

  IndicatorState copyWith({
    IndicatorStatus? indicatorStatus,
    List<IndicatorModel>? indicatorList,
  }) {
    return IndicatorState(
      indicatorStatus: indicatorStatus ?? this.indicatorStatus,
      indicatorList: indicatorList ?? this.indicatorList,
    );
  }
}
