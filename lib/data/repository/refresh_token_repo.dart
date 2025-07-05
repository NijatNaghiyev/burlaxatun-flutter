import 'package:burla_xatun/data/contractor/refresh_token_contract.dart';
import 'package:burla_xatun/data/services/remote/refresh_token_service.dart';
import 'package:dio/src/response.dart';

class RefreshTokenRepo implements RefreshTokenContract {
  RefreshTokenRepo(this._refreshTokenService);

  final RefreshTokenService _refreshTokenService;

  @override
  Future<Response> refreshToken(Map<String, dynamic> refreshToken) {
    return _refreshTokenService.refreshToken(refreshToken);
  }
}
