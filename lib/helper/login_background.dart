import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
  }

  @override
  //1초에 60프레임이 도는데 그게 도는동안 뒷배경도 다시 그리느냐 마느냐~
  bool shouldRepaint(CustomPainter oldDelegate) {
    //다시 그리지 않는다
    return false;
  }
}
