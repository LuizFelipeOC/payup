import 'package:flutter/material.dart';

class HomeWeeklyFilter extends StatefulWidget {
  const HomeWeeklyFilter({super.key});

  @override
  State<HomeWeeklyFilter> createState() => _HomeWeeklyFilterState();
}

class _HomeWeeklyFilterState extends State<HomeWeeklyFilter> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)),
              child: Center(child: Text('Week ${index + 1}')),
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
