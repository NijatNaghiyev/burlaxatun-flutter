import 'package:burla_xatun/cubits/about/about_cubit.dart';
import 'package:burla_xatun/cubits/contact/contact_cubit.dart';
import 'package:burla_xatun/cubits/daily_rec/daily_rec_cubit.dart';
import 'package:burla_xatun/cubits/faqs_cubit/faqs_cubit.dart';
import 'package:burla_xatun/cubits/login_cubit/login_cubit.dart';
import 'package:burla_xatun/cubits/privacy_policy/privacy_policy_cubit.dart';
import 'package:burla_xatun/cubits/signup_cubit/signup_cubit.dart';
import 'package:burla_xatun/cubits/using_rules/using_rules_cubit.dart';
import 'package:burla_xatun/data/contractor/about_contractor.dart';
import 'package:burla_xatun/data/contractor/contact_contractor.dart';
import 'package:burla_xatun/data/contractor/daily_rec_contractor.dart';
import 'package:burla_xatun/data/contractor/daily_rec_detail_contractor.dart';
import 'package:burla_xatun/data/contractor/faqs_contractor.dart';
import 'package:burla_xatun/data/contractor/login_contractor.dart';
import 'package:burla_xatun/data/contractor/privacy_policy_contractor.dart';
import 'package:burla_xatun/data/contractor/register_contractor.dart';
import 'package:burla_xatun/data/contractor/using_rules_contractor.dart';
import 'package:burla_xatun/data/repository/about_repository.dart';
import 'package:burla_xatun/data/repository/contact_repository.dart';
import 'package:burla_xatun/data/repository/daily_rec_repository.dart';
import 'package:burla_xatun/data/repository/faqs_repository.dart';
import 'package:burla_xatun/data/repository/login_repository.dart';
import 'package:burla_xatun/data/repository/privacy_policy_repository.dart';
import 'package:burla_xatun/data/repository/register_repository.dart';
import 'package:burla_xatun/data/repository/using_rules_repository.dart';
import 'package:burla_xatun/data/services/local/login_token_service.dart';
import 'package:burla_xatun/data/services/remote/about_service.dart';
import 'package:burla_xatun/data/services/remote/contact_service.dart';
import 'package:burla_xatun/data/services/remote/daily_rec_detail_service.dart';
import 'package:burla_xatun/data/services/remote/daily_rec_service.dart';
import 'package:burla_xatun/data/services/remote/faqs_service.dart';
import 'package:burla_xatun/data/services/remote/login_service.dart';
import 'package:burla_xatun/data/services/remote/privacy_policy_service.dart';
import 'package:burla_xatun/data/services/remote/register_service.dart';
import 'package:burla_xatun/data/services/remote/using_rules_service.dart';
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
  locator.registerLazySingleton(() => FaqsService());
  locator.registerLazySingleton(() => PrivacyPolicyService());
  locator.registerLazySingleton(() => UsingRulesService());
  locator.registerLazySingleton(() => AboutService());
  locator.registerLazySingleton(() => ContactService());

  // contractor
  locator.registerLazySingleton<LoginContractor>(
      () => LoginRepository(locator<LoginService>()));
  locator.registerLazySingleton<RegisterContractor>(
      () => RegisterRepository(locator<RegisterService>()));

  locator.registerLazySingleton<DailyRecContractor>(
      () => DailyRecRepository(locator<DailyRecService>()));

  locator.registerLazySingleton<DailyRecDetailContractor>(
      () => DailyRecDetailRepository(locator<DailyRecDetailService>()));

  locator.registerLazySingleton<FaqsContractor>(
      () => FaqsRepository(locator<FaqsService>()));

  locator.registerLazySingleton<PrivacyPolicyContractor>(
      () => PrivacyPolicyRepository(locator<PrivacyPolicyService>()));

  locator.registerLazySingleton<UsingRulesContractor>(
      () => UsingRulesRepository(locator<UsingRulesService>()));

  locator.registerLazySingleton<AboutContractor>(
      () => AboutRepository(locator<AboutService>()));

  locator.registerLazySingleton<ContactContractor>(
      () => ContactRepository(locator<ContactService>()));

  // cubit
  locator.registerFactory(() => LoginCubit(locator()));
  locator.registerFactory(() => DailyRecCubit(locator()));
  locator.registerFactory(() => DailyRecDetailCubit(locator()));
  locator.registerFactory(() => SignupCubit(locator()));
  locator.registerFactory(() => FaqsCubit(locator()));
  locator.registerFactory(() => PrivacyPolicyCubit(locator()));
  locator.registerFactory(() => UsingRulesCubit(locator()));
  locator.registerFactory(() => AboutCubit(locator()));
  locator.registerFactory(() => ContactCubit(locator()));
}
