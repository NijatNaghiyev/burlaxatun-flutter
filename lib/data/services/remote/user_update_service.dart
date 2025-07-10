import 'dart:io';

import 'package:burla_xatun/data/models/remote/response/user_update_model.dart';
import 'package:burla_xatun/data/services/local/login_token_service.dart';
import 'package:burla_xatun/data/services/remote/base_network_service.dart';
import 'package:burla_xatun/utils/constants/endpoints_constants.dart';
import 'package:burla_xatun/utils/di/locator.dart';
import 'package:burla_xatun/utils/extensions/statuscode_extension.dart';
import 'package:dio/dio.dart';

class UserUpdateService {
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
  }) async {
    final token = locator<LoginTokenService>().token;
    final endpoint = EndpointsConstants.userUpdate;

    final formData = FormData.fromMap({
      if (phoneNumber != null) "phone_number": phoneNumber,
      if (onboardingDone != null) "onboarding_done": onboardingDone,
      if (wantToBePregnant != null) "want_to_be_pregnant": wantToBePregnant,
      if (wantToSeePeriod != null) "want_to_see_period": wantToSeePeriod,
      if (isPregnant != null) "is_pregnant": isPregnant,
      if (pregnantWeek != null || pregnantWeek != '0')
        "pregnant_week": pregnantWeek,
      if (firstChild != null) "first_child": firstChild,
      if (activeLanguage != null) "active_language": activeLanguage,
      if (enableNotifications != null)
        "enable_notifications": enableNotifications,
      if (image != null)
        "image": await MultipartFile.fromFile(image.path,
            filename: image.path.split("/").last),
    });
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
          data: formData,
          options: Options(contentType: 'multipart/form-data'),
        );

    if (response.statusCode.isSuccess) {
      return UserUpdateResponse.fromJson(response.data);
    }
    if (response.statusCode.isFailure) {
      throw Exception("Failed to update user: User Update Service");
    }
    throw Exception("Unhandled error is occurred in User Update Service");
  }

  Future<bool> userProfileDelete() async {
    final token = locator<LoginTokenService>().token;
    final endpoint = EndpointsConstants.userProfileDelete;

    final response = await BaseNetwork.instance.getDio(token: token).delete(
          endpoint,
        );

    if (response.statusCode.isSuccess) {
      return true;
    }
    if (response.statusCode.isFailure) {
      throw Exception("Failed to delete user profile: User Update Service");
    }
    throw Exception("Unhandled error is occurred in User Update Service");
  }
}
