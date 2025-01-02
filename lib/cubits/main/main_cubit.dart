import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/local/bottom_navbar_items_model.dart';
import '../../data/models/local/main_page_box_model.dart';
import '../../ui/screens/main/views/daily_advise_page/daily_advise_page.dart';
import '../../ui/screens/main/views/forum_page/forum_page.dart';
import '../../ui/screens/main/views/home_page/advises/advises_page.dart';
import '../../ui/screens/main/views/home_page/home/home_page.dart';
import '../../ui/screens/main/views/home_page/names/names_page.dart';
import '../../ui/screens/main/views/home_page/ultrasound/ultrasound_page.dart';
import '../../ui/screens/main/views/profie_page/profile_page.dart';

class MainCubit extends Cubit<int> {
  MainCubit() : super(0);

  int indexOfView = 0;
  String viewName = 'Home';

  final navbarItems = BottomNavbarItemsModel.items;
  final boxItems = MainPageBoxModel.items;

  final List views = [
    HomePage(),
    DailyAdvisePage(),
    ForumPage(),
    ProfilePage(),
  ];

  final Map<String, Widget> homePageViews = {
    'Home': HomePage(),
    'Gündəlik Tövsiyyələr': AdvisesPage(),
    'Ultrasəs': BlocProvider(
      create: (context) => MainCubit(),
      child: UltrasoundPage(),
    ),
    'Uşaq adları': NamesPage(),
  };

  void changeView(int v) {
    indexOfView = v;
    emit(indexOfView);
  }

  void goToTappedView(String v, context) {
    viewName = v;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => homePageViews[viewName]!),
    );
  }

  void goBackMainPage(context) {
    Navigator.pop(context);
  }
}
