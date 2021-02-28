import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  final double size;

  const ClockView({Key key, this.size}) : super(key: key);
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
      height: widget.size,
      width: widget.size,
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
      ..strokeWidth = size.width / 20;
    var mainCenter = Paint()..color = Color(0xFF444974);
    var smallCenter = Paint()..color = Color(0xFFEAECFF);
//we need stroke here because we are doing canvas.drawLine() not rectangel so stroke and stroke Width is imp
    var secHand = Paint()
      ..color = Colors.orange[300]
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60;
    var minHand = Paint()
      ..shader = RadialGradient(
              colors: [Colors.lightBlue, Colors.pink]) //not color ..shader
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 20;
    // .createShader(Rect.fromCircle(center: center, radius: radius));

    var hourHand = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 20;

    canvas.drawCircle(center, radius * 0.75, mainCenter);
    canvas.drawCircle(center, radius * 0.75, strokeCircle);
    //the small circle z-index is greater then hands
    //the maths is simple (centerPoint + lengthOfHand * rotation)
    //(pi / 180) is 1 degree hai in all 360 degree rotation
    var minHandX =
        centerX + radius * 0.53 * cos(dateTime.minute * 6 * (pi / 180));
    //(pi/180 is 1degree)
    var minHandY =
        centerY + radius * 0.53 * sin(dateTime.minute * 6 * (pi / 180));
    canvas.drawLine(center, Offset(minHandX, minHandY), minHand);
    var secHandX = centerX + radius * 0.6 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerY + radius * 0.6 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHand);
    //EACH minute le half degree badauxa
    var hourHandX = centerX +
        radius *
            0.4 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * (pi / 180));
    var hourHandY = centerY +
        radius *
            0.4 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * (pi / 180));
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHand);
    canvas.drawCircle(center, 16, smallCenter);

    var dashBrush = Paint()
      ..color = Colors.grey[50].withOpacity(0.6)
      ..strokeWidth = 1;
    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
