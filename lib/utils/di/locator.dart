import 'package:burla_xatun/cubits/about/about_cubit.dart';
import 'package:burla_xatun/cubits/baby_names2/baby_names2_cubit.dart';
import 'package:burla_xatun/cubits/blog_cat/blog_cat_cubit.dart';
import 'package:burla_xatun/cubits/blog_sliders/blog_sliders_cubit.dart';
import 'package:burla_xatun/cubits/contact/contact_cubit.dart';
import 'package:burla_xatun/cubits/countries/countries_cubit.dart';
import 'package:burla_xatun/cubits/daily_rec/daily_rec_cubit.dart';
import 'package:burla_xatun/cubits/faqs_cubit/faqs_cubit.dart';
import 'package:burla_xatun/cubits/login_cubit/login_cubit.dart';
import 'package:burla_xatun/cubits/medicine/medicine_cubit.dart';
import 'package:burla_xatun/cubits/privacy_policy/privacy_policy_cubit.dart';
import 'package:burla_xatun/cubits/signup_cubit/signup_cubit.dart';
import 'package:burla_xatun/cubits/user_update/user_update_cubit.dart';
import 'package:burla_xatun/cubits/using_rules/using_rules_cubit.dart';
import 'package:burla_xatun/data/contractor/about_contractor.dart';
import 'package:burla_xatun/data/contractor/baby_names_contractor2.dart';
import 'package:burla_xatun/data/contractor/blog_cat_contractor.dart';
import 'package:burla_xatun/data/contractor/blog_sliders_contractor.dart';
import 'package:burla_xatun/data/contractor/contact_contractor.dart';
import 'package:burla_xatun/data/contractor/countries_contractor.dart';
import 'package:burla_xatun/data/contractor/daily_rec_contractor.dart';
import 'package:burla_xatun/data/contractor/daily_rec_detail_contractor.dart';
import 'package:burla_xatun/data/contractor/faqs_contractor.dart';
import 'package:burla_xatun/data/contractor/login_contractor.dart';
import 'package:burla_xatun/data/contractor/medicine_contractor.dart';
import 'package:burla_xatun/data/contractor/privacy_policy_contractor.dart';
import 'package:burla_xatun/data/contractor/register_contractor.dart';
import 'package:burla_xatun/data/contractor/user_update_contractor.dart';
import 'package:burla_xatun/data/contractor/using_rules_contractor.dart';
import 'package:burla_xatun/data/repository/about_repository.dart';
import 'package:burla_xatun/data/repository/baby_names_repository2.dart';
import 'package:burla_xatun/data/repository/blog_cat_repository.dart';
import 'package:burla_xatun/data/repository/blog_sliders_repository.dart';
import 'package:burla_xatun/data/repository/contact_repository.dart';
import 'package:burla_xatun/data/repository/countries_repository.dart';
import 'package:burla_xatun/data/repository/daily_rec_repository.dart';
import 'package:burla_xatun/data/repository/faqs_repository.dart';
import 'package:burla_xatun/data/repository/login_repository.dart';
import 'package:burla_xatun/data/repository/medicine_repository.dart';
import 'package:burla_xatun/data/repository/privacy_policy_repository.dart';
import 'package:burla_xatun/data/repository/register_repository.dart';
import 'package:burla_xatun/data/repository/user_update_repository.dart';
import 'package:burla_xatun/data/repository/using_rules_repository.dart';
import 'package:burla_xatun/data/services/local/login_token_service.dart';
import 'package:burla_xatun/data/services/remote/about_service.dart';
import 'package:burla_xatun/data/services/remote/baby_names_service2.dart';
import 'package:burla_xatun/data/services/remote/blog_cat_service.dart';
import 'package:burla_xatun/data/services/remote/blog_sliders_service.dart';
import 'package:burla_xatun/data/services/remote/contact_service.dart';
import 'package:burla_xatun/data/services/remote/countries_service.dart';
import 'package:burla_xatun/data/services/remote/daily_rec_detail_service.dart';
import 'package:burla_xatun/data/services/remote/daily_rec_service.dart';
import 'package:burla_xatun/data/services/remote/faqs_service.dart';
import 'package:burla_xatun/data/services/remote/login_service.dart';
import 'package:burla_xatun/data/services/remote/medicine_service.dart';
import 'package:burla_xatun/data/services/remote/privacy_policy_service.dart';
import 'package:burla_xatun/data/services/remote/register_service.dart';
import 'package:burla_xatun/data/services/remote/user_update_service.dart';
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
  locator.registerLazySingleton(() => CountriesService());
  locator.registerLazySingleton(() => BabyNamesService());
  locator.registerLazySingleton(() => BlogSlidersService());
  locator.registerLazySingleton(() => BlogCatService());
  locator.registerLazySingleton(() => MedicineService());
  locator.registerLazySingleton(() => UserUpdateService());

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

  locator.registerLazySingleton<CountriesContractor>(
      () => CountriesRepository(locator<CountriesService>()));

  locator.registerLazySingleton<BabyNamesContractor>(
      () => BabyNamesRepository(locator<BabyNamesService>()));

  locator.registerLazySingleton<BlogSlidersContractor>(
      () => BlogSlidersRepository(locator<BlogSlidersService>()));

  locator.registerLazySingleton<BlogCatContractor>(
      () => BlogCatRepository(locator<BlogCatService>()));

  locator.registerLazySingleton<MedicineContractor>(
      () => MedicineRepository(locator<MedicineService>()));

  locator.registerLazySingleton<UserUpdateContractor>(
      () => UserUpdateRepository(locator<UserUpdateService>()));

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
  locator.registerFactory(() => CountriesCubit(locator()));
  locator.registerFactory(() => BabyNamesCubit2(locator()));
  locator.registerFactory(() => BlogSlidersCubit(locator()));
  locator.registerFactory(() => BlogCatCubit(locator()));
  locator.registerFactory(() => MedicineCubit(locator()));
  locator.registerFactory(() => UserUpdateCubit(locator()));
}
