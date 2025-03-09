import 'package:burla_xatun/ui/screens/main/views/home_page/home/widgets/horizontal_calendar.dart';
import 'package:flutter/material.dart';

mixin HorizontalCalendarMixin on State<HorizontalCalendar> {
   final _currentDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  late final _minimumDate = _currentDate.subtract(const Duration(days: 365));
  late final _maximumDate = _currentDate.add(const Duration(days: 365));

  ///* The selected date
  ///* This is coming from Backend
  final selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  ///* Create a list of all dates between minimumDate and maximumDate
  List<DateTime> allDates = [];
  List<DateTime> allDatesGet() {
    final List<DateTime> dates = [];
    DateTime date = _minimumDate;

    while (date.isBefore(_maximumDate)) {
      dates.add(date);
      date = date.add(const Duration(days: 1));
    }

    return dates;
  }

  ///* Get the day name of the date
  String getDayName(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }

  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    allDates = allDatesGet();

    scrollController = ScrollController();
    // Scroll to middle after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final middleOffset = scrollController.position.maxScrollExtent / 2;

      scrollController.animateTo(
        middleOffset,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
