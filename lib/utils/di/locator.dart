import 'package:burla_xatun/cubits/login_cubit/login_cubit.dart';
import 'package:burla_xatun/data/contractor/login_contractor.dart';
import 'package:burla_xatun/data/repository/login_repository.dart';
import 'package:burla_xatun/data/services/local/login_token_service.dart';
import 'package:burla_xatun/data/services/remote/login_service.dart';
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

  // contractor
  locator.registerLazySingleton<LoginContractor>(
      () => LoginRepository(locator<LoginService>()));

  // cubit
  locator.registerFactory(() => LoginCubit(locator()));
}
