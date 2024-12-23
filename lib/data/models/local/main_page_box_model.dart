class MainPageBoxModel {
  const MainPageBoxModel({
    required this.boxName,
    required this.boxIcon,
    required this.route,
  });

  final String boxName;
  final String boxIcon;
  final String route;

  static const List items = [
    MainPageBoxModel(
      boxName: 'Mənim şəfa kartım',
      boxIcon: 'assets/icons/medicine_icon.svg',
      route: '/my_healing_card',
    ),
    MainPageBoxModel(
      boxName: 'Həkimlər',
      boxIcon: 'assets/icons/doctors_icon.svg',
      route: '/initial_doctors',
    ),
    MainPageBoxModel(
      boxName: 'Blog',
      boxIcon: 'assets/icons/blog_icon.svg',
      route: '/initial_blog',
    ),
    MainPageBoxModel(
      boxName: 'Videolar',
      boxIcon: 'assets/icons/videos_icon.svg',
      route: '/videos',
    ),
    MainPageBoxModel(
      boxName: 'Ultrasəs',
      boxIcon: 'assets/icons/ultrasound_icon.svg',
      route: '/ultrasound',
    ),
    MainPageBoxModel(
      boxName: 'Uşaq adları',
      boxIcon: 'assets/icons/list_icon.svg',
      route: '/initial_names',
    ),
  ];
}
