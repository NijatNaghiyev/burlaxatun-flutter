// @immutable
// abstract class MainnState extends Equatable {
//   const MainnState();

//   @override
//   List<Object?> get props => [];
// }
// extends MainnState
import 'package:burla_xatun/cubits/main/mainn_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MainInitial extends Equatable {
  const MainInitial({
    required this.indexOfView,
    required this.viewName,
    required this.ultrasoundFormat,
    required this.carouselIndex,
    required this.latestScrollPosition,
    required this.genderOption,
    required this.nameViewOptions,
    required this.profileViewName,
    required this.isFirstChild,
    required this.isShowQuestion,
    required this.selectedQuestionBox,
    required this.navigationShellContext,
    required this.isOverlayVisible,
    required this.commentBoxIndex,
    // required this.menuOption,
  });

  final int carouselIndex;
  final int indexOfView;
  final int selectedQuestionBox;
  final int commentBoxIndex;
  final double latestScrollPosition;
  final String viewName;
  final String profileViewName;
  final UltrasoundFormat ultrasoundFormat;
  final NameViewOption nameViewOptions;
  // final MenuOption menuOption;
  final GenderOption genderOption;
  final bool isFirstChild;
  final bool isShowQuestion;
  final bool isOverlayVisible;
  final BuildContext? navigationShellContext;

  @override
  List<Object?> get props => [
        indexOfView,
        viewName,
        ultrasoundFormat,
        carouselIndex,
        latestScrollPosition,
        genderOption,
        nameViewOptions,
        profileViewName,
        isFirstChild,
        isShowQuestion,
        selectedQuestionBox,
        navigationShellContext,
        isOverlayVisible,
        commentBoxIndex,
      ];

  MainInitial copyWith({
    int? indexOfView,
    int? carouselIndex,
    int? selectedQuestionBox,
    int? commentBoxIndex,
    String? viewName,
    String? profileViewName,
    UltrasoundFormat? ultrasoundFormat,
    NameViewOption? nameViewOptions,
    GenderOption? genderOption,
    double? latestScrollPosition,
    bool? isFirstChild,
    bool? isShowQuestion,
    bool? isOverlayVisible,
    BuildContext? navigationShellContext,
    Offset? commentTapUpBox,
  }) {
    return MainInitial(
      indexOfView: indexOfView ?? this.indexOfView,
      viewName: viewName ?? this.viewName,
      ultrasoundFormat: ultrasoundFormat ?? this.ultrasoundFormat,
      carouselIndex: carouselIndex ?? this.carouselIndex,
      latestScrollPosition: latestScrollPosition ?? this.latestScrollPosition,
      genderOption: genderOption ?? this.genderOption,
      nameViewOptions: nameViewOptions ?? this.nameViewOptions,
      profileViewName: profileViewName ?? this.profileViewName,
      isFirstChild: isFirstChild ?? this.isFirstChild,
      isShowQuestion: isShowQuestion ?? this.isShowQuestion,
      selectedQuestionBox: selectedQuestionBox ?? this.selectedQuestionBox,
      navigationShellContext:
          navigationShellContext ?? this.navigationShellContext,
      isOverlayVisible: isOverlayVisible ?? this.isOverlayVisible,
      commentBoxIndex: commentBoxIndex ?? this.commentBoxIndex,
    );
  }
}
