import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = new DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var strokeCircle = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    var mainCenter = Paint()..color = Color(0xFF444974);
    var smallCenter = Paint()..color = Color(0xFFEAECFF);
//we need stroke here because we are doing canvas.drawLine() not rectangel so stroke and stroke Width is imp
    var secHand = Paint()
      ..color = Colors.orange[300]
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;
    var minHand = Paint()
      ..shader = RadialGradient(
              colors: [Colors.lightBlue, Colors.pink]) //not color ..shader
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 14;
    // .createShader(Rect.fromCircle(center: center, radius: radius));

    var hourHand = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    canvas.drawCircle(center, radius - 40, mainCenter);
    canvas.drawCircle(center, radius - 40, strokeCircle);
    //the small circle z-index is greater then hands
    //the maths is simple (centerPoint + lengthOfHand * rotation)
    //(pi / 180) is 1 degree hai in all 360 degree rotation
    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * (pi / 180));
    //(pi/180 is 1degree)
    var minHandY = centerY + 80 * sin(dateTime.minute * 6 * (pi / 180));
    canvas.drawLine(center, Offset(minHandX, minHandY), minHand);
    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHand);
    //EACH minute le half degree badauxa
    var hourHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * (pi / 180));
    var hourHandY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * (pi / 180));
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHand);
    canvas.drawCircle(center, 16, smallCenter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
