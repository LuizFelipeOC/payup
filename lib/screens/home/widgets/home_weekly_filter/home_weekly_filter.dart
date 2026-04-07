import 'package:flutter/material.dart';
import 'package:payup/core/models/week_day_model.dart';
import 'package:payup/screens/home/widgets/home_weekly_filter/home_weekly_controller.dart';

class HomeWeeklyFilter extends StatefulWidget {
  const HomeWeeklyFilter({super.key, required this.callbackFunction});

  final Function(WeekDayModel) callbackFunction;

  @override
  State<HomeWeeklyFilter> createState() => _HomeWeeklyFilterState();
}

class _HomeWeeklyFilterState extends State<HomeWeeklyFilter> {
  final controller = HomeWeeklyController();

  @override
  void initState() {
    controller.getListWeeklyDays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 50,
        child: AnimatedBuilder(
          animation: controller,
          builder: (_, __) {
            if (controller.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final weekDay = controller.weekDays[index];

                return InkWell(
                  onTap: () {
                    widget.callbackFunction(weekDay);
                    controller.setSelectedWeekDay(weekDay);
                  },
                  child: Container(
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: controller.selectedWeekDay == weekDay ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text(weekDay.label)),
                  ),
                );
              },
              itemCount: controller.weekDays.length,
            );
          },
        ),
      ),
    );
  }
}
