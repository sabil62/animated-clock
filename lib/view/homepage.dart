import 'package:animated_clock/json/sidebar.dart';
import 'package:animated_clock/json/sidebarProvider.dart';
import 'package:animated_clock/model/menuType.dart';
import 'package:animated_clock/view/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
              children: List.generate(sidebarr.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: sideItems(
                      // sidebars[index]["assets"], sidebars[index]["text"]
                      sidebarr[index]),
                );
              }),
            ),
            VerticalDivider(
              width: 1,
              color: Colors.white.withOpacity(0.5),
            ),
            //SIDE RIGHT
            Expanded(
              child: Consumer(builder:
                  (BuildContext context, MenuClass value, Widget child) {
                if (value.text != "Clock") {
                  //OR if(value.MenuType != MenuClass.clock)
                  return Container();
                }
                return Container(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                          child: Text(
                            "Clock",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontFamily: "avenir"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                          ],
                        ),
                      ),
                      //clockview
                      Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 55),
                                child: ClockView(size: 290.0),
                              ))),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Timezone",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: "avenir",
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "UTC" + offsetSign + timezoneString,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: "avenir"),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            // Expanded(child: null),
          ],
        ));
  }

  Widget sideItems(MenuClass currenMenuObj) {
    return Consumer<MenuClass>(
      builder: (BuildContext context, MenuClass value, Widget child) {
        return FlatButton(
          // color: text == "Clock" ? Colors.red.withOpacity(0.2) : null,
          color: currenMenuObj.text == value.text
              ? Colors.blueGrey[800].withOpacity(0.65)
              : null,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(32.0))),

          onPressed: () {
            var menuClass = Provider.of<MenuClass>(context,
                listen:
                    false); //bcoz we are calling outside of main so listen: false
            menuClass.updatedMenuClass(currenMenuObj);
          },
          child: Column(
            children: [
              Image.asset(
                currenMenuObj.assets,
                scale: 1.5,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                currenMenuObj.text,
                style: TextStyle(color: Colors.white, fontFamily: "avenir"),
              )
            ],
          ),
        );
      },
    );
  }
}

// child: TextButton(
//   // color: text == "Clock" ? Colors.red.withOpacity(0.2) : null,
//   onPressed: () {
//     var menuClass = Provider.of<MenuClass>(context);
//     menuClass.updatedMenuClass(menuclassobj);
//   },
//   child: Column(
//     children: [
//       Image.asset(
//         menuclassobj.assets,
//         scale: 1.5,
//       ),
//       SizedBox(
//         height: 10,
//       ),
//       Text(
//         menuclassobj.text,
//         style: TextStyle(color: Colors.white, fontFamily: "avenir"),
//       )
//     ],
//   ),
// ),
