import 'package:flutter/material.dart';
import 'package:payup/core/shared/widgets/buttons/button.dart';
import 'package:payup/core/shared/widgets/card_payments/card_payments.dart';
import 'package:payup/screens/home/widgets/client_list/client_list.dart';
import 'package:payup/screens/home/widgets/home_weekly_filter/home_weekly_controller.dart';
import 'package:payup/screens/home/widgets/home_weekly_filter/home_weekly_filter.dart';
import 'package:payup/screens/home/widgets/user_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final listPaymentsToReceive = [];

  final HomeWeeklyController weeklyController = HomeWeeklyController();

  @override
  void initState() {
    weeklyController.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 55)),

          HomeWeeklyFilter(
            callbackFunction: (value) {
              weeklyController.setSelectedWeekDay(value);
              weeklyController.isToday(value);
            },
          ),

          SliverToBoxAdapter(child: SizedBox(height: 20)),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ValueListenableBuilder(
                valueListenable: weeklyController,
                builder: (_, _, _) {
                  if (weeklyController.isLoading) return const SizedBox();

                  final isToday = weeklyController.isTodayValue.value;

                  return Text(
                    isToday ? 'Hoje' : weeklyController.value?.label ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  );
                },
              ),
            ),
          ),

          if (listPaymentsToReceive.isEmpty) ...[
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: CardPayments(type: CardPaymentType.empty)),
          ],

          SliverToBoxAdapter(child: SizedBox(height: 48)),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Button(label: 'Adicionar Cliente', onPressed: () {}),
            ),
          ),

          ClientList(),
        ],
      ),
    );
  }
}
