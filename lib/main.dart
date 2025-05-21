import 'package:burla_xatun/cubits/about/about_cubit.dart';
import 'package:burla_xatun/cubits/blog_cat/blog_cat_cubit.dart';
import 'package:burla_xatun/cubits/blog_sliders/blog_sliders_cubit.dart';
import 'package:burla_xatun/cubits/contact/contact_cubit.dart';
import 'package:burla_xatun/cubits/countries/countries_cubit.dart';
import 'package:burla_xatun/cubits/daily_rec/daily_rec_cubit.dart';
import 'package:burla_xatun/cubits/daily_rec_detail/daily_rec_detail_cubit.dart';
import 'package:burla_xatun/cubits/doctors_list/doctors_list_cubit.dart';
import 'package:burla_xatun/cubits/faqs_cubit/faqs_cubit.dart';
import 'package:burla_xatun/cubits/forum_category/forum_category_cubit.dart';
import 'package:burla_xatun/cubits/forum_comments/forum_comments_cubit.dart';
import 'package:burla_xatun/cubits/forum_create/forum_create_cubit.dart';
import 'package:burla_xatun/cubits/medicine/medicine_cubit.dart';
import 'package:burla_xatun/cubits/medicine_create/medicine_create_cubit.dart';
import 'package:burla_xatun/cubits/medicine_patch/medicine_patch_cubit.dart';
import 'package:burla_xatun/cubits/privacy_policy/privacy_policy_cubit.dart';
import 'package:burla_xatun/cubits/user_data/user_data_cubit.dart';
import 'package:burla_xatun/cubits/user_update/user_update_cubit.dart';
import 'package:burla_xatun/cubits/using_rules/using_rules_cubit.dart';
import 'package:burla_xatun/utils/constants/color_constants.dart';
import 'package:burla_xatun/utils/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cubits/doctors_detail/doctors_detail_cubit.dart';
import 'cubits/language_cubit/language_cubit.dart';
import 'cubits/main_cubit/mainn_cubit.dart';
import 'cubits/signup_cubit/signup_cubit.dart';
import 'data/models/local/user_data_model.dart';
import 'generated/l10n.dart';
import 'utils/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await init();
  await setupLocator();
  Hive.registerAdapter(UserDataModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainnCubit(),
        ),
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider<SignupCubit>(
          create: (context) => locator<SignupCubit>(),
        ),
        BlocProvider<DailyRecCubit>(
          create: (context) => locator<DailyRecCubit>()..getDailyRec(),
        ),
        BlocProvider<DailyRecDetailCubit>(
          create: (context) => locator<DailyRecDetailCubit>(),
        ),

        BlocProvider<FaqsCubit>(
          create: (context) => locator<FaqsCubit>()..getFaqs(),
        ),

        BlocProvider<PrivacyPolicyCubit>(
          create: (context) =>
              locator<PrivacyPolicyCubit>()..getPrivacyPolicy(),
        ),

        BlocProvider<UsingRulesCubit>(
          create: (context) => locator<UsingRulesCubit>()..getUsingRules(),
        ),

        BlocProvider<AboutCubit>(
            create: (context) => locator<AboutCubit>()..getAbout()),

        BlocProvider<ContactCubit>(
          create: (context) => locator<ContactCubit>()..getContact(),
        ),

        BlocProvider<CountriesCubit>(
          create: (context) => locator<CountriesCubit>()..getCountries(),
        ),

        BlocProvider<BlogSlidersCubit>(
          create: (context) => locator<BlogSlidersCubit>()..getBlogSliders(),
        ),

        BlocProvider<BlogCatCubit>(
          create: (context) => locator<BlogCatCubit>()..getBlogCat(),
        ),

        BlocProvider<MedicineCubit>(
          create: (context) => locator<MedicineCubit>()..getMedicines(),
        ),

        BlocProvider<MedicineCreateCubit>(
          create: (context) => locator<MedicineCreateCubit>(),
        ),

        BlocProvider<MedicinePatchCubit>(
          create: (context) => locator<MedicinePatchCubit>(),
        ),

        BlocProvider<UserUpdateCubit>(
          create: (context) => locator<UserUpdateCubit>(),
        ),

        BlocProvider<ForumCategoryCubit>(
          create: (context) =>
              locator<ForumCategoryCubit>()..getForumCategory(),
        ),

        BlocProvider<ForumCommentsCubit>(
          create: (context) =>
              locator<ForumCommentsCubit>()..getForumComments(),
        ),

        BlocProvider<ForumCreateCubit>(
          create: (context) => locator<ForumCreateCubit>(),
        ),

        BlocProvider<DoctorsListCubit>(
          create: (context) => locator<DoctorsListCubit>()..getDoctorsList(),
        ),

        BlocProvider(
          create: (context) => locator<DoctorDetailCubit>(),
        ),

        BlocProvider(
          create: (context) => locator<UserDataCubit>()..getUserData(),
        ),

        // BlocProvider(
        //   create: (context) => BabyNamesCubit(),
        // )
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: ColorConstants.white,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            localizationsDelegates: [
              S.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: state,
            routerConfig: Routerapp.instance.router,
          );
        },
      ),
    );
  }
}

// DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (BuildContext context) {
//         return MyApp();
//       },
//       // child: MyApp(),
//     ),
