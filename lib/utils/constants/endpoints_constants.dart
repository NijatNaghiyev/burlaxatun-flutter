class EndpointsConstants {
  EndpointsConstants._();

  static const String baseUrl = 'https://burla-backend-py.onrender.com';

  // Authentication
  static const login = '$baseUrl/A/users/access-token/';
  static const register = '$baseUrl/A/user-register/';
  static const userUpdate = "$baseUrl/A/user-update/";
  
  static const users = '$baseUrl/users';

  static const String pregnancyCalculateDetails =
      '$baseUrl/B1/pregnancy-calculate/';

  // Baby
  static const String babyUrl = '$baseUrl/baby';
  static const String countries = '$babyUrl/name_countries';
  static const String names = '$babyUrl/names';
  static const String selectedNames = '$names/select';

  // Extra
  static const String dailyRec = '$baseUrl/extra/daily-recommendations/';
  static const String dailyRecDetail =
      '$baseUrl/extra/daily-recommendations-detail/{slug}/';
}
