import 'package:animated_clock/enum.dart';
import 'package:animated_clock/model/menuType.dart';

import 'package:animated_clock/view/homepage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//   // var initializationSettingsAndroid =
//   //     AndroidInitializationSettings("SabilCube");

//   // var initializationSettings =
//   //     InitializationSettings(initializationSettingsAndroid);

//   // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//   //     onSelectNotification: (String payload) async {
//   //   if (payload != null) {
//   //     debugPrint("nofification payload: " + payload);
//   //   }
//   // });
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
// // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('sabil_cube');
// // final IOSInitializationSettings initializationSettingsIOS =
// //     IOSInitializationSettings(
// //         onDidReceiveLocalNotification: onDidReceiveLocalNotification);
// // final MacOSInitializationSettings initializationSettingsMacOS =
// //     MacOSInitializationSettings();
//   final InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     // iOS: initializationSettingsIOS,
//     // macOS: initializationSettingsMacOS
//   );
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: (String payload) async {
//     if (payload != null) {
//       debugPrint("nofification payload: " + payload);
//     }
//   });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Clock App',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
          create: (context) => MenuClass(MenuType.clock), child: HomePage()),
    );
  }
}
