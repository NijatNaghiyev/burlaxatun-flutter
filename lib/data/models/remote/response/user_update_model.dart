import 'package:equatable/equatable.dart';

class UserUpdateResponse extends Equatable {
  final String? phoneNumber;
  final bool? onboardingDone;
  final bool? wantToBePregnant;
  final bool? wantToSeePeriod;
  final bool? isPregnant;
  final String? pregnantWeek;
  final bool? firstChild;
  final String? image;
  final String? activeLanguage;
  final bool? enableNotifications;

  const UserUpdateResponse({
    this.phoneNumber,
    this.onboardingDone,
    this.wantToBePregnant,
    this.wantToSeePeriod,
    this.isPregnant,
    this.pregnantWeek,
    this.firstChild,
    this.image,
    this.activeLanguage,
    this.enableNotifications,
  });

  factory UserUpdateResponse.fromJson(Map<String, dynamic> json) =>
      UserUpdateResponse(
        phoneNumber: json["phone_number"],
        onboardingDone: json["onboarding_done"],
        wantToBePregnant: json["want_to_be_pregnant"],
        wantToSeePeriod: json["want_to_see_period"],
        isPregnant: json["is_pregnant"],
        pregnantWeek: json["pregnant_week"],
        firstChild: json["first_child"],
        image: json["image"],
        activeLanguage: json["active_language"],
        enableNotifications: json["enable_notifications"],
      );

  Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "onboarding_done": onboardingDone,
        "want_to_be_pregnant": wantToBePregnant,
        "want_to_see_period": wantToSeePeriod,
        "is_pregnant": isPregnant,
        "pregnant_week": pregnantWeek,
        "first_child": firstChild,
        "image": image,
        "active_language": activeLanguage,
        "enable_notifications": enableNotifications,
      };

  @override
  List<Object?> get props => [
        phoneNumber,
        onboardingDone,
        wantToBePregnant,
        wantToSeePeriod,
        isPregnant,
        pregnantWeek,
        firstChild,
        image,
        activeLanguage,
        enableNotifications,
      ];
}
