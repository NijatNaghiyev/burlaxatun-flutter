class MainPageBoxModel {
  const MainPageBoxModel({
    required this.boxName,
    required this.boxIcon,
  });

  final String boxName;
  final String boxIcon;

  static const List items = [
    MainPageBoxModel(
      boxName: 'Dərmanlar',
      boxIcon: 'assets/icons/medicine_icon.svg',
    ),
    MainPageBoxModel(
      boxName: 'Gündəlik \nTövsiyyələr',
      boxIcon: 'assets/icons/pregnan_icon.svg',
    ),
    MainPageBoxModel(
      boxName: 'Həkimlər',
      boxIcon: 'assets/icons/doctors_icon.svg',
    ),
    MainPageBoxModel(
      boxName: 'Blog',
      boxIcon: 'assets/icons/blog_icon.svg',
    ),
    MainPageBoxModel(
      boxName: 'Videolar',
      boxIcon: 'assets/icons/videos_icon.svg',
    ),
    MainPageBoxModel(
      boxName: 'Ultrasəs',
      boxIcon: 'assets/icons/ultrasound_icon.svg',
    ),
    MainPageBoxModel(
      boxName: 'Uşaq adları',
      boxIcon: 'assets/icons/list_icon.svg',
    ),
    MainPageBoxModel(
      boxName: 'Sağlam qida',
      boxIcon: 'assets/icons/healthy_food_icon.svg',
    ),
  ];
}
