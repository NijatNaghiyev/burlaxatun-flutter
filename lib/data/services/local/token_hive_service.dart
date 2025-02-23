class TokenHiveService {
  TokenHiveService._();

  static TokenHiveService? _instance;

  static TokenHiveService get instance => _instance ??= TokenHiveService._();
}
