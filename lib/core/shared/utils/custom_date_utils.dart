import 'package:intl/intl.dart';
import 'package:payup/core/models/week_day_model.dart';

class CustomDateUtils {
  List<WeekDayModel> getCurrentWeekDays() {
    final now = DateTime.now();
    final firstDay = now.subtract(Duration(days: now.weekday - 1));
    final formatter = DateFormat.E('pt_BR');

    return List.generate(7, (index) {
      final date = firstDay.add(Duration(days: index));

      return WeekDayModel(
        index: date.weekday,
        label: formatter.format(date).toUpperCase().replaceAll('.', ''),
        date: date,
      );
    });
  }
}
