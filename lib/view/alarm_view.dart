import 'package:flutter/material.dart';

class Alarm_view extends StatefulWidget {
  @override
  _Alarm_viewState createState() => _Alarm_viewState();
}

class _Alarm_viewState extends State<Alarm_view> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
      child: Column(
        children: [
          Text(
            "Alarm",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontFamily: "avenir"),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
