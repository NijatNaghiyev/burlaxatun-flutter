import 'package:burla_xatun/cubits/login_cubit/login_cubit.dart';
import 'package:burla_xatun/cubits/signup_cubit/signup_cubit.dart';
import 'package:burla_xatun/data/contractor/login_contractor.dart';
import 'package:burla_xatun/data/contractor/register_contractor.dart';
import 'package:burla_xatun/data/repository/login_repository.dart';
import 'package:burla_xatun/data/repository/register_repository.dart';
import 'package:burla_xatun/data/services/local/login_token_service.dart';
import 'package:burla_xatun/data/services/remote/login_service.dart';
import 'package:burla_xatun/data/services/remote/register_service.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

final GetIt locator = GetIt.instance;
Future<void> init() async {
  await Hive.initFlutter();
}

Future<void> setupLocator() async {
  final Box<String> box = await Hive.openBox('loginBox');

  // services
  locator.registerLazySingleton(() => LoginTokenService(box));
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => RegisterService());

  // contractor
  locator.registerLazySingleton<LoginContractor>(
      () => LoginRepository(locator<LoginService>()));
  locator.registerLazySingleton<RegisterContractor>(
      () => RegisterRepository(locator<RegisterService>()));

  // cubit
  locator.registerFactory(() => LoginCubit(locator()));
  locator.registerFactory(() => SignupCubit(locator()));
}
