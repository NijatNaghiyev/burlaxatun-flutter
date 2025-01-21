import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../cubits/login_cubit/login_cubit.dart';
import '../../cubits/onboarding_cubit/onboarding_cubit.dart';
import '../../cubits/questions_cubit/questions_cubit.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';
import '../../ui/screens/auth/login/login.dart';
import '../../ui/screens/auth/sign_up/signup.dart';
import '../../ui/screens/main/main_page.dart';
import '../../ui/screens/main/views/daily_advise_page/advises_page.dart';
import '../../ui/screens/main/views/forum_page/forum_page.dart';
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
import '../../ui/screens/main/views/profie_page/initial_profile/initial_profile_page.dart';
import '../../ui/screens/onboarding/onboarding.dart';
import '../../ui/screens/questions/questions.dart';

class Routerapp {
  static Routerapp? _instance;
  // Avoid self instance
  Routerapp._();
  static Routerapp get instance => _instance ??= Routerapp._();

  // static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  // static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  final GoRouter router = GoRouter(
    // initialLocation: '/',
    // navigatorKey: _rootNavigatorKey,
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
        builder: (context, state) => BlocProvider(
          create: (context) => SignupCubit(),
          child: SignUp(),
        ),
      ),
      GoRoute(
        path: '/questions',
        builder: (context, state) => BlocProvider(
          create: (context) => QuestionsCubit(),
          child: Questions(),
        ),
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
            // initialLocation: '/home',
            // preload: true,
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
              // GoRoute(
              //   path: '/my_medicines',
              //   builder: (context, state) => MyMedicinesPage(),
              // ),
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
                builder: (context, state) => InitialNamesPage(),
              ),
              GoRoute(
                path: '/gender_names',
                builder: (context, state) => GenderNames(),
              ),
            ],
          ),
          StatefulShellBranch(
            // initialLocation: '/daily_advices',
            routes: [
              GoRoute(
                path: '/daily_advices',
                builder: (context, state) => AdvisesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            // initialLocation: '/forum_page',
            routes: [
              GoRoute(
                path: '/forum_page',
                builder: (context, state) => ForumPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            // initialLocation: 'profile_page',
            routes: [
              GoRoute(
                path: '/profile_page',
                builder: (context, state) => InitialProfilePage(),
              ),
            ],
          )
        ],
      )
    ],
  );
}
