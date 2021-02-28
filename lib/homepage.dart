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
          child: Column(
            children: [
              Text(
                "Clock",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(
                "Clock",
                style: TextStyle(fontSize: 64, color: Colors.white),
              ),
              Text(
                "Clock",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              ClockView(),
              Text(
                "Timezone",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Row(
                children: [
                  Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                  Text(
                    "UTC",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  )
                ],
              )
            ],
          ),
        )

        //  Container(
        //   color: Color(0xFF2D2F41),
        //   alignment: Alignment.center,
        //   child: ClockView(),
        // ),
        );
  }
}
