import 'package:animated_clock/constants/theme_data.dart';
import 'package:animated_clock/json/alarmJson.dart';
import 'package:dotted_border/dotted_border.dart';
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
                .map<Widget>((ala) => Container(
                      margin: EdgeInsetsDirectional.only(bottom: 26),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 9),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: ala.gradients.last.withOpacity(0.33),
                                spreadRadius: 1.7,
                                blurRadius: 8,
                                offset: Offset(3, 4))
                          ],
                          gradient: LinearGradient(
                              // colors: [Colors.purple, Colors.pink],
                              colors: ala.gradients,
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
                              //This is toggle widget
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
                .followedBy([
              DottedBorder(
                dashPattern: [5, 4],
                strokeWidth: 3,
                color: CustomColors.clockOutline,
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      color: CustomColors.clockBG,
                      borderRadius: BorderRadius.circular(14)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/add_alarm.png",
                                  scale: 1.7,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Add Alarm",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "avenir"),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ]).toList(),
          ))
        ],
      ),
    );
  }
}
