import 'dart:io';

import 'package:burla_xatun/data/contractor/user_update_contractor.dart';
import 'package:burla_xatun/data/models/remote/response/user_update_model.dart';
import 'package:burla_xatun/data/services/remote/user_update_service.dart';

class UserUpdateRepository implements UserUpdateContractor {
  UserUpdateRepository(this._userUpdateService);
  final UserUpdateService _userUpdateService;

  @override
  Future<UserUpdateResponse?> updateUser({
    String? phoneNumber,
    bool? onboardingDone,
    bool? wantToBePregnant,
    bool? wantToSeePeriod,
    bool? isPregnant,
    String? pregnantWeek,
    bool? firstChild,
    File? image,
    String? activeLanguage,
    bool? enableNotifications,
  }) {
    return _userUpdateService.updateUser(
      phoneNumber: phoneNumber,
      onboardingDone: onboardingDone,
      wantToBePregnant: wantToBePregnant,
      wantToSeePeriod: wantToSeePeriod,
      isPregnant: isPregnant,
      pregnantWeek: pregnantWeek,
      firstChild: firstChild,
      image: image,
      activeLanguage: activeLanguage,
      enableNotifications: enableNotifications,
    );
  }
}
