class RegisterResponseModel {
  final String? refresh;
  final String? access;
  final String? activeLanguage;
  final bool? onboardingDone;
  final bool? enableNotifications;

  RegisterResponseModel({
    this.refresh,
    this.access,
    this.activeLanguage,
    this.onboardingDone,
    this.enableNotifications,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        refresh: json["refresh"],
        access: json["access"],
        activeLanguage: json["active_language"],
        onboardingDone: json["onboarding_done"],
        enableNotifications: json["enable_notifications"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "active_language": activeLanguage,
        "onboarding_done": onboardingDone,
        "enable_notifications": enableNotifications,
      };
}
