import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sizeX = size.width / 2;
    var sizeY = size.height / 2;
    var center = Offset(sizeX, sizeY);
    var radius = min(sizeX, sizeY);

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
      ..strokeWidth = 16;
    var minHand = Paint()
      ..shader = RadialGradient(
              colors: [Colors.lightBlue, Colors.pink]) //not color ..shader
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;
    // .createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius - 40, mainCenter);
    canvas.drawCircle(center, radius - 40, strokeCircle);
    //the small circle z-index is greater then hands
    canvas.drawLine(center, Offset(100, 100), minHand);
    canvas.drawLine(center, Offset(200, 100), secHand);
    canvas.drawCircle(center, 16, smallCenter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}
