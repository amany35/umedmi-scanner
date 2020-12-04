import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/CovidDashBoard/screens/Covid_screen.dart';
import 'package:umedmiscanner/features/CovidDashBoard/screens/stats_screen.dart';




class CovidPageView extends StatefulWidget {
  @override
  _CovidPageViewState createState() => _CovidPageViewState();
}

class _CovidPageViewState extends State<CovidPageView> {

  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        CovidScreen(),
        StatsScreen(),
        CovidScreen(),
      ],
    );
  }

}

