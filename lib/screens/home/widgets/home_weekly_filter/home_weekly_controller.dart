import 'package:flutter/material.dart';
import 'package:payup/core/models/week_day_model.dart';
import 'package:payup/core/shared/utils/custom_date_utils.dart';

class HomeWeeklyController extends ValueNotifier<WeekDayModel?> {
  bool isLoading = false;
  ValueNotifier<bool> isTodayValue = ValueNotifier(false);
  final customDateUtils = CustomDateUtils();

  WeekDayModel? selectedWeekDay;
  List<WeekDayModel> weekDays = [];

  HomeWeeklyController() : super(null);

  void initialize() {
    getListWeeklyDays();
    getCurrentWeekDay();

    if (value != null) {
      isToday(value!);
    }
  }

  void getListWeeklyDays() {
    isLoading = true;
    notifyListeners();

    weekDays = customDateUtils.getCurrentWeekDays();

    isLoading = false;
    notifyListeners();
  }

  void setSelectedWeekDay(WeekDayModel weekDay) {
    value = weekDay;
    notifyListeners();
  }

  void getCurrentWeekDay() {
    final now = DateTime.now();

    final currentWeekDay = weekDays.firstWhere(
      (day) => day.index == now.weekday,
      orElse: () => weekDays.first,
    );

    setSelectedWeekDay(currentWeekDay);
  }

  bool isToday(WeekDayModel weekDay) {
    final now = DateTime.now();

    isTodayValue.value = weekDay.index == now.weekday;
    value = weekDay;

    return isTodayValue.value;
  }
}
