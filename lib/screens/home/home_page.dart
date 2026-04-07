import 'package:flutter/material.dart';
import 'package:payup/screens/home/widgets/home_weekly_filter/home_weekly_filter.dart';
import 'package:payup/screens/home/widgets/user_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 55)),
          HomeWeeklyFilter(callbackFunction: (value) {}),
        ],
      ),
    );
  }
}
