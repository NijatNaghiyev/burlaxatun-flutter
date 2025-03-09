import 'package:equatable/equatable.dart';

class VideoInitial extends Equatable {
  const VideoInitial({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  List<Object?> get props => [
        isLoading,
      ];

  VideoInitial copyWith({
    bool? isLoading,
  }) {
    return VideoInitial(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
