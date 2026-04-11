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
  final HomeWeeklyController controller = HomeWeeklyController();

  @override
  void initState() {
    controller.initialize();
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

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChoiceChip(
                    label: Text(weekDay.label),
                    selected: weekDay.index == controller.value?.index,
                    onSelected: (value) {
                      widget.callbackFunction(weekDay);
                      controller.setSelectedWeekDay(weekDay);
                      controller.isToday(weekDay);
                    },
                    side: weekDay.index == controller.value?.index
                        ? BorderSide(color: Theme.of(context).primaryColor, width: 1)
                        : BorderSide(color: Theme.of(context).chipTheme.backgroundColor!, width: 1),
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
