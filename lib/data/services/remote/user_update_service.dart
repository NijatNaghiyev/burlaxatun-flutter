import 'package:burla_xatun/data/models/remote/response/user_update_model.dart';
import 'package:burla_xatun/data/services/local/register_token_service.dart';
import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/constants/endpoints_constants.dart';
import 'package:burla_xatun/utils/di/locator.dart';
import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';

class UserUpdateService {
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
  }) async {
    final token = locator<RegisterTokenService>().token;
    final endpoint = EndpointsConstants.userUpdate;
    final requestBody = {};
    phoneNumber != null ? requestBody["phone_number"] = phoneNumber : null;
    requestBody["onboarding_done"] = onboardingDone;
    requestBody["want_to_be_pregnant"] = wantToBePregnant;
    requestBody["want_to_see_period"] = wantToSeePeriod;
    isPregnant != null ? requestBody["is_pregnant"] = isPregnant : null;
    pregnantWeek != null ? requestBody["pregnant_week"] = pregnantWeek : null;
    firstChild != null ? requestBody["first_child"] = firstChild : null;
    activeLanguage != null
        ? requestBody["active_language"] = activeLanguage
        : null;
    requestBody["enable_notifications"] = enableNotifications;

    // {
    //   "phone_number": phoneNumber,
    //   "onboarding_done": onboardingDone,
    //   "want_to_be_pregnant": wantToBePregnant,
    //   "want_to_see_period": wantToSeePeriod,
    //   "is_pregnant": isPregnant,
    //   "pregnant_week": pregnantWeek,
    //   "first_child": firstChild,
    //   "active_language": activeLanguage,
    //   "enable_notifications": enableNotifications,
    // };

    final response = await BaseNetwork.instance.getDio(token: token).patch(
          endpoint,
          data: requestBody,
        );

    if (response.statusCode.isSuccess) {
      return UserUpdateModel.fromJson(response.data);
    }
    if (response.statusCode.isFailure) {
      throw Exception("Failed to update user: User Update Service");
    }
    throw Exception("Unhandled error is occured in User Update Service");
  }
}
