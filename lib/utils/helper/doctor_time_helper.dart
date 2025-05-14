class DoctorTimeHelper {
  static List<String> generateHourlyTimes(String availableTime) {
    final parts = availableTime.split('-');
    if (parts.length != 2) return [];

    final startTime = _parseTime(parts[0].trim());
    final endTime = _parseTime(parts[1].trim());

    if (startTime == null || endTime == null) return [];

    final List<String> result = [];
    var current = startTime;

    while (!current.isAfter(endTime)) {
      final formatted = '${current.hour.toString().padLeft(2, '0')}:00';
      result.add(formatted);
      current = current.add(Duration(hours: 1));
    }

    return result;
  }

  static DateTime? _parseTime(String time) {
    final parts = time.split(':');
    if (parts.length != 2) return null;

    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);

    if (hour == null || minute == null) return null;

    return DateTime(0, 1, 1, hour, minute);
  }
}
