import 'package:animated_clock/clock_view.dart';
import 'package:animated_clock/json/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var formattedTime = DateFormat("HH:mm").format(DateTime.now());
    var formattedDate = DateFormat("EEE, d MMM").format(DateTime.now());

    var timezoneString =
        DateTime.now().timeZoneOffset.toString().split(".").first;
    var offsetSign = '';
    if (!timezoneString.startsWith("-")) {
      offsetSign = "+";
      print(timezoneString);
    }

    return Scaffold(
        backgroundColor: Color(0xFF2D2F41),
        body: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(sidebars.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: sideItems(
                      sidebars[index]["assets"], sidebars[index]["text"]),
                );
              }),
            ),
            VerticalDivider(
              width: 1,
              color: Colors.white.withOpacity(0.5),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Container(
                  // padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Clock",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: "avenir"),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        formattedTime,
                        style: TextStyle(
                            fontSize: 64,
                            color: Colors.white,
                            fontFamily: "avenir"),
                      ),
                      Text(
                        formattedDate,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "avenir"),
                      ),
                      ClockView(),
                      Row(
                        children: [
                          Icon(
                            Icons.language,
                            color: Colors.white,
                          ),
                          Text(
                            "UTC" + offsetSign + timezoneString,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontFamily: "avenir"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )

        //  Container(
        //   color: Color(0xFF2D2F41),
        //   alignment: Alignment.center,
        //   child: ClockView(),
        // ),
        );
  }

  FlatButton sideItems(asset, text) {
    return FlatButton(
      onPressed: () {},
      child: Column(
        children: [
          Image.asset(
            asset,
            scale: 1.5,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontFamily: "avenir"),
          )
        ],
      ),
    );
  }
}
