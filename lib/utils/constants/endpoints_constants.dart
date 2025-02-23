class EndpointsConstants {
  EndpointsConstants._();

  static const String baseUrl = 'https://burla-api.secop.az';

  // Authentication
  static const String users = '$baseUrl/users';

  static const String login = '$users/login';
  static const String register = '$users/register';
  static const String tokenInfo = '';
  static const String tokenRefresh = '';
  static const String changePassword = '';
}
