import 'package:flutter/material.dart';
import 'package:payup/core/shared/widgets/buttons/button.dart';
import 'package:payup/core/shared/widgets/card_payments/card_payments.dart';
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

  final HomeWeeklyController controller = HomeWeeklyController();

  @override
  void initState() {
    controller.initialize();
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
              controller.setSelectedWeekDay(value);
              controller.isToday(value);
            },
          ),

          if (listPaymentsToReceive.isEmpty) ...[
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ValueListenableBuilder(
                  valueListenable: controller,
                  builder: (_, _, _) {
                    if (controller.isLoading) return const SizedBox();

                    final isToday = controller.isTodayValue.value;

                    return Text(
                      isToday ? 'Hoje' : controller.value?.label ?? '',
                      style: Theme.of(context).textTheme.titleMedium,
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),

            SliverToBoxAdapter(child: CardPayments(type: CardPaymentType.empty)),
          ],

          SliverToBoxAdapter(child: SizedBox(height: 48)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Button(label: 'Adicionar Cliete', onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
