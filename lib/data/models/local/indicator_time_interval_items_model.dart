class IndicatorTimeIntervalItemsModel {
  IndicatorTimeIntervalItemsModel({
    required this.interval,
    required this.range,
  });

  final String interval;
  final String range;

  static List<IndicatorTimeIntervalItemsModel> items = [
    IndicatorTimeIntervalItemsModel(
      interval: 'Gün',
      range: 'daily',
    ),
    IndicatorTimeIntervalItemsModel(
      interval: 'Həftə',
      range: 'weekly',
    ),
    IndicatorTimeIntervalItemsModel(
      interval: 'Ay',
      range: 'monthly',
    ),
    IndicatorTimeIntervalItemsModel(
      interval: 'İl',
      range: 'yearly',
    ),
  ];
}
