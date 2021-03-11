import 'package:animated_clock/constants/theme_data.dart';
import 'package:animated_clock/json/alarmJson.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AlarmView extends StatefulWidget {
  @override
  _AlarmViewState createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
  // get flutterLocalNotificationsPlugin => null;

  @override
  void initState() {
    super.initState();

    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('sabil_Cube');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    var localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      if (payload != null) {
        debugPrint("nofification payload: " + payload);
      }
    });
    // FlutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future onShowLocalNotification() async {
    // display a dialog with the notification details, tap ok to go to another page
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'channelId', 'Local Notification', 'Anything',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    // var iosDetails = new IOSNotificationDetails();
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await FlutterLocalNotificationsPlugin().show(
        0, 'Lion', 'Tiger is the real king of jungle', platformChannelSpecifics,
        payload: 'item x');
  }

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
                          onPressed: () {
                            // scheduleAlarm();
                            onShowLocalNotification();
                          },
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

  // void scheduleAlarm() async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails('channelId', 'Animated Clock', 'Anything',
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           showWhen: false);

  //   const NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await AnimatedClock.show(
  //       2,
  //       'Title of Notification',
  //       'Body of Notifiication larger lorem sorem borem',
  //       platformChannelSpecifics,
  //       payload: 'item x');
  // }

}
