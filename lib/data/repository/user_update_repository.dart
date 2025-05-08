import 'package:burla_xatun/data/contractor/user_update_contractor.dart';
import 'package:burla_xatun/data/models/remote/response/user_update_model.dart';
import 'package:burla_xatun/data/services/remote/user_update_service.dart';

class UserUpdateRepository implements UserUpdateContractor {
  UserUpdateRepository(this._userUpdateService);
  final UserUpdateService _userUpdateService;

  @override
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
  }) {
    return _userUpdateService.updateUser(
      activeLanguage: activeLanguage,
      enableNotifications: enableNotifications,
      firstChild: firstChild,
      isPregnant: isPregnant,
      onboardingDone: onboardingDone,
      phoneNumber: phoneNumber,
      pregnantWeek: pregnantWeek,
      wantToBePregnant: wantToBePregnant,
      wantToSeePeriod: wantToSeePeriod,
    );
  }
}
