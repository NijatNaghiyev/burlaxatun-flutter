import 'dart:developer';

import 'package:burla_xatun/data/models/local/settings_items_model.dart';
import 'package:burla_xatun/ui/screens/main/views/home_page/my_healing_page/my_medicines/initial_medicine_page/widgets/add_medicine_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/local/bottom_navbar_items_model.dart';
import '../../data/models/local/main_page_box_model.dart';
import '../../data/models/local/my_healing_card_items_model.dart';
import '../../data/models/local/profile_sections_items_model.dart';
import '../../ui/screens/main/views/daily_advise_page/advises_page.dart';
import '../../ui/screens/main/views/forum_page/main_forum_page.dart/forum_page.dart';
import '../../ui/screens/main/views/home_page/doctor/initial_doctor_page/widgets/doctors_notification.dart';
import '../../ui/screens/main/views/home_page/home.dart';
import '../../ui/screens/main/views/home_page/home/home_page.dart';
import '../../ui/screens/main/views/home_page/my_healing_page/body_weight_view/widgets/add_new_indicator_dialog.dart';
import '../../ui/screens/main/views/home_page/my_healing_page/body_weight_view/widgets/calendar_dialog.dart';
import '../../ui/screens/main/views/home_page/my_healing_page/initial_my_healing_page/my_healing_page.dart';
import '../../ui/screens/main/views/home_page/my_healing_page/my_medicines/initial_medicine_page/my_medicines_page.dart';
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
            navigationShellContext: null,
          ),
        );

  final ScrollController homePageScrollController = ScrollController();

  final navbarItems = BottomNavbarItemsModel.items;
  final boxItems = MainPageBoxModel.items;
  final profileSectionItems = ProfileSectionsItemsModel.items;
  final myHealingCardItems = MyHealingCardItemsModel.items;
  final settingItems = SettingsItemModel.items;

  final List views = [
    Home(),
    MainForumPage(),
    MyHealingPage(),
    InitialProfilePage(),
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
    'Notification': NotificationPage(),
    'Videolar': VideoPage(),
    'Dərmanlar': MyHealingPage(),
  };

  void setShellContext(v) {
    emit(state.copyWith(navigationShellContext: v));
  }

  void changeView(int v) {
    emit(state.copyWith(indexOfView: v));
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
    // log('$v');
    emit(state.copyWith(carouselIndex: v));
  }

  void showBottomSheetAboutChild(Widget widget) {
    showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: state.navigationShellContext!,
      builder: (_) {
        return widget;
      },
    );
  }

  void pushScaffoldMyMedicinesPage() {
    // state.navigationShellContext!.pushReplacement('location');
    Navigator.push(
      state.navigationShellContext!,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => MainnCubit(),
          child: MyMedicinesPage(),
        ),
      ),
    );
  }

  void showDoctorsNotification() {
    showModalBottomSheet(
      showDragHandle: true,
      context: state.navigationShellContext!,
      builder: (BuildContext context) {
        return DoctorsNotification();
      },
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

  void showAddMedicine(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AddMedicineDialog();
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
