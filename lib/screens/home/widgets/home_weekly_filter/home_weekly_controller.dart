import 'package:flutter/material.dart';
import 'package:payup/core/models/week_day_model.dart';
import 'package:payup/core/shared/utils/custom_date_utils.dart';

class HomeWeeklyController extends ChangeNotifier {
  bool isLoading = false;
  final customDateUtils = CustomDateUtils();

  WeekDayModel? selectedWeekDay;
  List<WeekDayModel> weekDays = [];

  void getListWeeklyDays() {
    isLoading = true;
    notifyListeners();

    weekDays = customDateUtils.getCurrentWeekDays();

    isLoading = false;
    notifyListeners();
  }

  void setSelectedWeekDay(WeekDayModel weekDay) {
    selectedWeekDay = weekDay;
    notifyListeners();
  }
}
