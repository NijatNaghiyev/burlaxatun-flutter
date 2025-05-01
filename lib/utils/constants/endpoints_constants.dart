class EndpointsConstants {
  EndpointsConstants._();

  static const String baseUrl = 'https://burla-backend-py.onrender.com';

  // Authentication
  static const String users = '$baseUrl/users';

  static const String login = '$baseUrl/A/users/access-token/';
  static const String register = '$baseUrl/A/user-register/';
  static const String tokenInfo = '';
  static const String tokenRefresh = '';
  static const String changePassword = '';

  static const String pregnancyCalculateDetails =
      '$baseUrl/pregnancy/calculate';

  // Baby
  static const String babyUrl = '$baseUrl/baby';
  static const String countries = '$babyUrl/name_countries';
  static const String names = '$babyUrl/names';
  static const String selectedNames = '$names/select';

  // Extra
  static const String dailyRec = '$baseUrl/extra/daily-recommendations/';
}
