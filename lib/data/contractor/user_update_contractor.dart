import 'package:burla_xatun/data/models/remote/response/user_update_model.dart';

abstract class UserUpdateContractor {
  Future<UserUpdateModel> updateUser({
    String? phoneNumber,
    bool? onboardingDone,
    bool? wantToBePregnant,
    bool? wantToSeePeriod,
    bool? isPregnant,
    String? pregnantWeek,
    bool? firstChild,
    String? activeLanguage,
    bool? enableNotifications,
  });
}
