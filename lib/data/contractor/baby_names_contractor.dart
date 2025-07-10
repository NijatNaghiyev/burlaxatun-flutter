import 'package:dio/dio.dart';

abstract class BabyNamesContractor {
  Future<Response<dynamic>> getCountries();

  Future<Response<dynamic>> getBabyNamesByCountryId({
    required String countryId,
    required String gender,
  });

  Future<Response<dynamic>> getWishListNames();

  Future<Response<dynamic>> removeFromWishList({
    required int babyNameId,
  });

  Future<Response<dynamic>> addToWishList({
    required int babyNameId,
  });
}
