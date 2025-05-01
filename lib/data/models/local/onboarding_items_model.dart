import '../../../utils/constants/asset_constants.dart';
import '../../../utils/constants/text_constants.dart';

class OnboardItemsModel {
  const OnboardItemsModel({
    required this.onboardTitle,
    required this.onboardTitleBold,
    required this.onboardImage,
    required this.onboardDescription,
  });

  final String onboardTitle;
  final String onboardTitleBold;
  final String onboardImage;
  final String onboardDescription;

  static const List items = [
    OnboardItemsModel(
      onboardTitle: TextConstants.welcomeTo,
      onboardTitleBold: TextConstants.burlaXatun,
      onboardImage: AssetConstants.onboard1,
      onboardDescription: TextConstants.trustedCompanion,
    ),
    OnboardItemsModel(
      onboardTitle: TextConstants.navigatePregnancy,
      onboardTitleBold: TextConstants.together,
      onboardImage: AssetConstants.onboard2,
      onboardDescription: TextConstants.addYourPartner,
    ),
    OnboardItemsModel(
      onboardTitle: TextConstants.community,
      onboardTitleBold: TextConstants.support,
      onboardImage: AssetConstants.onboard3,
      onboardDescription: TextConstants.companySupport,
    ),
  ];
}
