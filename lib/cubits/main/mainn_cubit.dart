import 'dart:developer';

import '../../ui/screens/main/views/home_page/doctor/initial_doctor_page/widgets/doctors_notification.dart';
import '../../ui/screens/main/views/profie_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/local/bottom_navbar_items_model.dart';
import '../../data/models/local/main_page_box_model.dart';
import '../../data/models/local/profile_sections_items_model.dart';
import '../../ui/screens/main/views/daily_advise_page/body_weight_view/widgets/add_new_indicator_dialog.dart';
import '../../ui/screens/main/views/daily_advise_page/body_weight_view/widgets/calendar_dialog.dart';
import '../../ui/screens/main/views/daily_advise_page/daily_advise_page.dart';
import '../../ui/screens/main/views/forum_page/forum_page.dart';
import '../../ui/screens/main/views/home_page/advises/advises_page.dart';
import '../../ui/screens/main/views/home_page/blog/blog_view.dart';
import '../../ui/screens/main/views/home_page/doctor/doctors_page.dart';
import '../../ui/screens/main/views/home_page/home.dart';
import '../../ui/screens/main/views/home_page/home/home_page.dart';
import '../../ui/screens/main/views/home_page/my_medicines/my_medicines_page.dart';
import '../../ui/screens/main/views/home_page/names/names_page.dart';
import '../../ui/screens/main/views/home_page/notification/notification_page.dart';
import '../../ui/screens/main/views/home_page/ultrasound/ultrasound_page.dart';
import '../../ui/screens/main/views/home_page/video/video_page.dart';
import '../../ui/screens/main/views/profie_page/about_us/about_us_view.dart';
import '../../ui/screens/main/views/profie_page/contact_us/contact_us_view.dart';
import '../../ui/screens/main/views/profie_page/faq/faq_view.dart';
import '../../ui/screens/main/views/profie_page/initial_profile/initial_profile_page.dart';
import '../../ui/screens/main/views/profie_page/pricavy_policy/privacy_policy_view.dart';
import '../../ui/screens/main/views/profie_page/settings/setting_view.dart';
import '../../ui/screens/main/views/profie_page/special_thanks/special_thanks_view.dart';
import '../../ui/screens/main/views/profie_page/terms_of_use/terms_of_use_view.dart';
import 'main_state.dart';

enum UltrasoundFormat { format2d, format3d }

enum NameViewOption { countries, selecteds }

enum GenderOption { boy, girl }

class MainnCubit extends Cubit<MainInitial> {
  MainnCubit()
      : super(
          MainInitial(
            indexOfView: 0,
            viewName: 'Home',
            profileViewName: 'initial_profile',
            carouselIndex: 0,
            latestScrollPosition: 0,
            genderOption: GenderOption.boy,
            nameViewOptions: NameViewOption.countries,
            ultrasoundFormat: UltrasoundFormat.format2d,
            isFirstChild: true,
            isShowQuestion: false,
            selectedQuestionBox: -1,
          ),
        ) {
    homePageScrollController.addListener(() {
      log('scrolled pixels: ${homePageScrollController.position.pixels}');
      emit(state.copyWith(
          latestScrollPosition: homePageScrollController.position.pixels));
    });
  }
  final ScrollController homePageScrollController = ScrollController();

  final navbarItems = BottomNavbarItemsModel.items;
  final boxItems = MainPageBoxModel.items;
  final profileSectionItems = ProfileSectionsItemsModel.items;

  final List views = [
    Home(),
    DailyAdvisePage(),
    ForumPage(),
    ProfilePage(),
  ];

  final Map<String, Widget> profileViews = {
    'initial_profile': InitialProfilePage(),
    'settings': SettingView(),
    'faq': FaqView(),
    'about_us': AboutUsView(),
    'contact_us': ContactUsView(),
    'terms_of_use': TermsOfUseView(),
    'privacy_policy': PrivacyPolicyView(),
    'special_thanks': SpecialThanksView(),
  };

  final Map<String, Widget> homePageViews = {
    'Home': HomePage(),
    'Gündəlik Tövsiyyələr': AdvisesPage(),
    'Ultrasəs': UltrasoundPage(),
    'Uşaq adları': NamesPage(),
    'Notification': NotificationPage(),
    'Blog': BlogView(),
    'Videolar': VideoPage(),
    'Həkimlər': DoctorsPage(),
    'Dərmanlar': MyMedicinesPage(),
  };

  void changeMainView(int v) {
    emit(state.copyWith(indexOfView: v));
    v == 0 ? scrollLatestPositionHomePage() : null;
  }

  void changeHomeView(String v) {
    emit(state.copyWith(viewName: v));
  }

  void changeProfileView(String v) {
    emit(state.copyWith(profileViewName: v));
  }

  void goBackInitialProfileView() {
    emit(state.copyWith(profileViewName: 'initial_profile'));
  }

  void changeFormat(UltrasoundFormat v) {
    emit(state.copyWith(ultrasoundFormat: v));
  }

  void changeNameView(NameViewOption v) {
    emit(state.copyWith(nameViewOptions: v));
  }

  void changeGender(GenderOption v) {
    emit(state.copyWith(genderOption: v));
  }

  void updateCarouselIndex(int v) {
    log('$v');
    emit(state.copyWith(carouselIndex: v));
  }

  void scrollLatestPositionHomePage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (homePageScrollController.hasClients) {
        homePageScrollController.jumpTo(state.latestScrollPosition);
      } else {
        log('ScrollController is not attached to any scroll views.');
      }
    });
  }

  void showBottomSheet(context, Widget widget) {
    showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return widget;
      },
    );
  }

  void showDoctorsNotification(context) {
    showBottomSheet(
      context,
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
        child: DoctorsNotification(),
      ),
    );
  }

  void showCalendar(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return CalendarDialog();
      },
    );
  }

  void showAddIndicator(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AddNewIndicatorDialog();
      },
    );
  }

  void firstChildToggle(bool v) {
    emit(state.copyWith(isFirstChild: v));
  }

  void isShowToggle(int v) {
    if (state.selectedQuestionBox != v) {
      emit(state.copyWith(isShowQuestion: true));
    } else {
      emit(state.copyWith(isShowQuestion: !state.isShowQuestion));
    }
    // emit(state.copyWith(isShowQuestion: !state.isShowQuestion));
  }

  void updateSelectedQuestionBox(int v) {
    emit(state.copyWith(selectedQuestionBox: v));
  }

  @override
  Future<void> close() {
    homePageScrollController.dispose();
    return super.close();
  }
}
