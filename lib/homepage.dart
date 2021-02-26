import 'package:animated_clock/clock_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2D2F41),
        body: Center(
          child: ClockView(),
        )

        //  Container(
        //   color: Color(0xFF2D2F41),
        //   alignment: Alignment.center,
        //   child: ClockView(),
        // ),
        );
  }
}
