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

  static const String faqs = '$baseUrl/extra/faq/';
  static const String privacyPolicy = '$baseUrl/extra/privacy-policy/';
  static const String usingRules = '$baseUrl/extra/using-rules/';
  static const String about = '$baseUrl/extra/about/';
  static const String contact = '$baseUrl/extra/contact-details/';
  static const String extraCountries = '$baseUrl/extra/countries/';
  static const String babyNames = '$baseUrl/extra/baby-names/';
  static const String blogSliders = '$baseUrl/extra/blog-sliders/';
  static const String blogCategories = '$baseUrl/extra/blogs-with-categories/';

  // C
  static const String medicines = '$baseUrl/C/medicines/';
  static const String medicineCreate = '$baseUrl/C/medicines/create/';

  // D
  static const forumCategory = "$baseUrl/D/forum-category-stats/";
  static const String doctorsList = '$baseUrl/C/doctors-list/';
  static const String doctorDetail = '$baseUrl/C/doctors-detail/{slug}/';
}
