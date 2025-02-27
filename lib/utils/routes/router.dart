import 'package:burla_xatun/cubits/baby_names_cubit/baby_names_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../cubits/login_cubit/login_cubit.dart';
import '../../cubits/onboarding_cubit/onboarding_cubit.dart';
import '../../cubits/questions_cubit/questions_cubit.dart';
import '../../ui/screens/auth/login/login.dart';
import '../../ui/screens/auth/sign_up/signup.dart';
import '../../ui/screens/main/main_page.dart';
import '../../ui/screens/main/views/daily_advise_page/advises_page.dart';
import '../../ui/screens/main/views/forum_page/main_forum_page.dart/forum_page.dart';
import '../../ui/screens/main/views/forum_page/new_forum_page/create_new_forum.dart';
import '../../ui/screens/main/views/forum_page/secondary_forum_page/secondary_forum_page.dart';
import '../../ui/screens/main/views/home_page/blog/article_details/article_details_page.dart';
import '../../ui/screens/main/views/home_page/blog/initial_blog/initial_blog_page.dart';
import '../../ui/screens/main/views/home_page/blog/see_all_articles/see_all_articles_page.dart';
import '../../ui/screens/main/views/home_page/doctor/initial_doctor_page/initial_doctor_page.dart';
import '../../ui/screens/main/views/home_page/doctor/registration_doctor_page/registration_doctor_page.dart';
import '../../ui/screens/main/views/home_page/home/home_page.dart';
import '../../ui/screens/main/views/home_page/my_healing_page/body_weight_view/body_weight_page.dart';
import '../../ui/screens/main/views/home_page/my_healing_page/initial_my_healing_page/my_healing_page.dart';
import '../../ui/screens/main/views/home_page/names/gender_names/gender_names.dart';
import '../../ui/screens/main/views/home_page/names/initial_names/initial_names_page.dart';
import '../../ui/screens/main/views/home_page/notification/notification_page.dart';
import '../../ui/screens/main/views/home_page/ultrasound/ultrasound_page.dart';
import '../../ui/screens/main/views/home_page/video/video_page.dart';
import '../../ui/screens/main/views/profie_page/about_us/about_us_view.dart';
import '../../ui/screens/main/views/profie_page/contact_us/contact_us_view.dart';
import '../../ui/screens/main/views/profie_page/faq/faq_view.dart';
import '../../ui/screens/main/views/profie_page/initial_profile/initial_profile_page.dart';
import '../../ui/screens/main/views/profie_page/pricavy_policy/privacy_policy_view.dart';
import '../../ui/screens/main/views/profie_page/settings/setting_view.dart';
import '../../ui/screens/main/views/profie_page/settings/setting_views/change_language/change_language_view.dart';
import '../../ui/screens/main/views/profie_page/settings/setting_views/change_password/change_password_view.dart';
import '../../ui/screens/main/views/profie_page/settings/setting_views/change_phone_number/change_phone_number_view.dart';
import '../../ui/screens/main/views/profie_page/special_thanks/special_thanks_view.dart';
import '../../ui/screens/main/views/profie_page/terms_of_use/terms_of_use_view.dart';
import '../../ui/screens/onboarding/onboarding.dart';
import '../../ui/screens/questions/questions.dart';
import '../../ui/screens/questions/widgets/calculate_birth_view/calculate_birth.dart';

class Routerapp {
  static Routerapp? _instance;
  // Avoid self instance
  Routerapp._();
  static Routerapp get instance => _instance ??= Routerapp._();

  // static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  // static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  final GoRouter router = GoRouter(
    // initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => OnboardingCubit(),
          child: Onboarding(),
        ),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: Login(),
        ),
      ),
      GoRoute(
        path: '/sign_up',
        builder: (context, state) {
          return SignUp();
        },
      ),
      GoRoute(
        path: '/questions',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => QuestionsCubit(),
            child: Questions(),
          );
        },
      ),
      GoRoute(
        path: '/calculate',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => QuestionsCubit(),
            child: CalculateBirth(),
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainPage(
            navigationShell: navigationShell,
            shellContext: context,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => HomePage(),
              ),
              GoRoute(
                path: '/videos',
                builder: (context, state) => VideoPage(),
              ),
              GoRoute(
                path: '/notification',
                builder: (context, state) => NotificationPage(),
              ),
              GoRoute(
                path: '/my_healing_card',
                builder: (context, state) => MyHealingPage(),
              ),
              GoRoute(
                path: '/body_weight',
                builder: (context, state) => BodyWeightPage(),
              ),
              GoRoute(
                path: '/initial_doctors',
                builder: (context, state) => InitialDoctorPage(),
              ),
              GoRoute(
                path: '/doctor_register',
                builder: (context, state) => RegistrationDoctorPage(),
              ),
              GoRoute(
                path: '/initial_blog',
                builder: (context, state) => InitialBlogPage(),
              ),
              GoRoute(
                path: '/article_details',
                builder: (context, state) => ArticleDetailsPage(),
              ),
              GoRoute(
                path: '/see_all_articles',
                builder: (context, state) => SeeAllArticlesPage(),
              ),
              GoRoute(
                path: '/videos',
                builder: (context, state) => VideoPage(),
              ),
              GoRoute(
                path: '/ultrasound',
                builder: (context, state) => UltrasoundPage(),
              ),
              GoRoute(
                path: '/initial_names',
                builder: (context, state) => BlocProvider(
                  create: (context) => BabyNamesCubit()..getCountriesAndSelectedNames(),
                  child: InitialNamesPage(),
                ),
              ),
              GoRoute(
                path: '/gender_names',
                builder: (context, state) {
                  final id = state.extra as String;
                  return BlocProvider(
                    create: (context) => BabyNamesCubit()..getNames(id),
                    child: GenderNames(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/daily_advices',
                builder: (context, state) => AdvisesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/main_forum',
                builder: (context, state) => MainForumPage(),
              ),
              GoRoute(
                path: '/secondary_forum',
                builder: (context, state) => SecondaryForumPage(),
              ),
              GoRoute(
                path: '/create_new_forum',
                builder: (context, state) => CreateNewForum(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile_page',
                builder: (context, state) => InitialProfilePage(),
              ),
              GoRoute(
                path: '/about_us',
                builder: (context, state) => AboutUsView(),
              ),
              GoRoute(
                path: '/contact_us',
                builder: (context, state) => ContactUsView(),
              ),
              GoRoute(
                path: '/faq',
                builder: (context, state) => FaqView(),
              ),
              GoRoute(
                path: '/privacy_policy',
                builder: (context, state) => PrivacyPolicyView(),
              ),
              GoRoute(
                path: '/settings',
                builder: (context, state) => SettingView(),
              ),
              GoRoute(
                path: '/special_thanks',
                builder: (context, state) => SpecialThanksView(),
              ),
              GoRoute(
                path: '/terms_of_use',
                builder: (context, state) => TermsOfUseView(),
              ),
              GoRoute(
                path: '/change_language',
                builder: (context, state) => ChangeLanguageView(),
              ),
              GoRoute(
                path: '/change_password',
                builder: (context, state) => ChangePasswordView(),
              ),
              GoRoute(
                path: '/change_number',
                builder: (context, state) => ChangePhoneNumberView(),
              ),
            ],
          )
        ],
      )
    ],
  );
}
