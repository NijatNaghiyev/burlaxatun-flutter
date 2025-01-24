class SettingsItemModel {
  SettingsItemModel({
    required this.icon,
    required this.settingName,
  });

  final String icon;
  final String settingName;

  static List<SettingsItemModel> items = [
    SettingsItemModel(
      icon: 'assets/icons/setting_bing_icon.svg',
      settingName: 'Bildirişlər',
    ),
    SettingsItemModel(
      icon: 'assets/icons/faq_icon.svg',
      settingName: 'Şifrəni dəyiş',
    ),
    SettingsItemModel(
      icon: 'assets/icons/privacy_policy_icon.svg',
      settingName: 'Mobil nömrəni dəyiş',
    ),
    SettingsItemModel(
      icon: 'assets/icons/setting_global_icon.svg',
      settingName: 'İstifadə dilini dəyiş',
    ),
  ];
}
