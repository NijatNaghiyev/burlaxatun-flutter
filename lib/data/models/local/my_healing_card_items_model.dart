class MyHealingCardItemsModel {
  const MyHealingCardItemsModel({
    required this.icon,
    required this.tileName,
    required this.route,
  });

  final String icon;
  final String tileName;
  final String route;

  static const List items = [
    MyHealingCardItemsModel(
      icon: 'assets/png/medicine_icon.png',
      tileName: 'Bədən çəkisi',
      route: '/body_weight',
    ),
    MyHealingCardItemsModel(
      icon: 'assets/png/medicine_icon.png',
      tileName: 'Dərmanlarım',
      route: '/my_medicines',
    ),
    MyHealingCardItemsModel(
      icon: 'assets/png/medicine_icon.png',
      tileName: 'Boy',
      route: '/body_height',
    ),
  ];
}
