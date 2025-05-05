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
  static const String dailyRecDetail =
      '$baseUrl/extra/daily-recommendations-detail/{slug}/';

  static const String faqs = '$baseUrl/extra/faq/';
  static const String privacyPolicy = '$baseUrl/extra/privacy-policy/';
  static const String usingRules = '$baseUrl/extra/using-rules/';
  static const String about = '$baseUrl/extra/about/';
  static const String contact = '$baseUrl/extra/contact-details/';
}
