import 'dart:io';

import 'package:burla_xatun/data/models/remote/response/user_update_model.dart';
import 'package:burla_xatun/data/services/local/register_token_service.dart';
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
    final token = locator<RegisterTokenService>().token;
    final endpoint = EndpointsConstants.userUpdate;

    final formData = FormData.fromMap({
      if (phoneNumber != null) "phone_number": phoneNumber,
      if (onboardingDone != null) "onboarding_done": onboardingDone,
      if (wantToBePregnant != null) "want_to_be_pregnant": wantToBePregnant,
      if (wantToSeePeriod != null) "want_to_see_period": wantToSeePeriod,
      if (isPregnant != null) "is_pregnant": isPregnant,
      if (pregnantWeek != null) "pregnant_week": pregnantWeek,
      if (firstChild != null) "first_child": firstChild,
      if (activeLanguage != null) "active_language": activeLanguage,
      if (enableNotifications != null)
        "enable_notifications": enableNotifications,
      if (image != null)
        "image": await MultipartFile.fromFile(image.path,
            filename: image.path.split("/").last),
    });

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
}
