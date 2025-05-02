import 'package:burla_xatun/cubits/daily_rec/daily_rec_cubit.dart';
import 'package:burla_xatun/cubits/login_cubit/login_cubit.dart';
import 'package:burla_xatun/cubits/signup_cubit/signup_cubit.dart';
import 'package:burla_xatun/data/contractor/daily_rec_contractor.dart';
import 'package:burla_xatun/data/contractor/daily_rec_detail_contractor.dart';
import 'package:burla_xatun/data/contractor/login_contractor.dart';
import 'package:burla_xatun/data/contractor/register_contractor.dart';
import 'package:burla_xatun/data/repository/daily_rec_repository.dart';
import 'package:burla_xatun/data/repository/login_repository.dart';
import 'package:burla_xatun/data/repository/register_repository.dart';
import 'package:burla_xatun/data/services/local/login_token_service.dart';
import 'package:burla_xatun/data/services/remote/daily_rec_detail_service.dart';
import 'package:burla_xatun/data/services/remote/daily_rec_service.dart';
import 'package:burla_xatun/data/services/remote/login_service.dart';
import 'package:burla_xatun/data/services/remote/register_service.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

import '../../cubits/daily_rec_detail/daily_rec_detail_cubit.dart';
import '../../data/repository/daily_rec_detail_repository.dart';

final GetIt locator = GetIt.instance;

Future<void> init() async {
  await Hive.initFlutter();
}

Future<void> setupLocator() async {
  final Box<String> box = await Hive.openBox('loginBox');

  // services
  locator.registerLazySingleton(() => LoginTokenService(box));
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => DailyRecService());
  locator.registerLazySingleton(() => RegisterService());
  locator.registerLazySingleton(() => DailyRecDetailService());

  // contractor
  locator.registerLazySingleton<LoginContractor>(
      () => LoginRepository(locator<LoginService>()));
  locator.registerLazySingleton<RegisterContractor>(
      () => RegisterRepository(locator<RegisterService>()));

  locator.registerLazySingleton<DailyRecContractor>(
      () => DailyRecRepository(locator<DailyRecService>()));

  locator.registerLazySingleton<DailyRecDetailContractor>(
      () => DailyRecDetailRepository(locator<DailyRecDetailService>()));

  // cubit
  locator.registerFactory(() => LoginCubit(locator()));
  locator.registerFactory(() => DailyRecCubit(locator()));
  locator.registerFactory(() => DailyRecDetailCubit(locator()));
  locator.registerFactory(() => SignupCubit(locator()));
}
