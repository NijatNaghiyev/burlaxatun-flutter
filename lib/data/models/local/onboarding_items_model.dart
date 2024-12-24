import '../../../utils/constants/asset_constants.dart';
import '../../../utils/constants/text_constants.dart';

class OnboardItemsModel {
  final String onboardImage;
  final String onboardTitle;

  const OnboardItemsModel({
    required this.onboardImage,
    required this.onboardTitle,
  });

  static const List items = [
    OnboardItemsModel(
      onboardImage: AssetConstants.trust,
      onboardTitle: TextConstants.trust
    ),
    OnboardItemsModel(
      onboardImage: AssetConstants.sendMoneyAbroad,
      onboardTitle: TextConstants.sendMoneyAbroad,
    ),
    OnboardItemsModel(
      onboardImage: AssetConstants.receiveMoney,
      onboardTitle: TextConstants.receiveMoney,
    ),
  ];
}
