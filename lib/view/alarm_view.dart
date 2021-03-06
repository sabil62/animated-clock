import 'package:animated_clock/json/alarmJson.dart';
import 'package:flutter/material.dart';

class AlarmView extends StatefulWidget {
  @override
  _AlarmViewState createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
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
          ),
          Expanded(
              child: ListView(
            children: alarmData
                .map((ala) => Container(
                      margin: EdgeInsetsDirectional.only(bottom: 26),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 9),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.red.withOpacity(0.33),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: Offset(3, 4))
                          ],
                          gradient: LinearGradient(
                              colors: [Colors.purple, Colors.pink],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.label,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    ala.description,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontFamily: "avenir"),
                                  )
                                ],
                              ),
                              Switch(
                                value: true,
                                onChanged: (bool value) {},
                                activeColor: Colors.white,
                              )
                            ],
                          ),
                          Text(
                            "Mon-Fri",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white54,
                                fontFamily: "avenir"),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "7:00 AM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: "avenir",
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ))
                .toList(),
          ))
        ],
      ),
    );
  }
}
