import 'package:flutter/material.dart';

//CustomPaint : 캔버스를 제공하고 페인트 명령을 실행
//CustomPaint 위젯을 상속
class LoginBackground extends CustomPainter {
  final bool isJoin;

  //필수값으로 명시해서 초기화
  LoginBackground({@required this.isJoin});

  @override
  //그림 그리는 곳
  void paint(Canvas canvas, Size size) {
    //.. : 동일 객체에 여러 메서드를 호출해야하는 경우, 동일한 타겟을 반복하지 않아도 됨
    //계단식 표기법(cascade)
//    ex)
//    Employee employee = Employee()
//    ..name = 'Cha'
//    ..setAge(29)
//    ..showInfo();
    Paint paint = Paint()..color = isJoin ? Colors.red : Colors.blue;
    canvas.drawCircle(
        Offset(size.width * 0.5, size.height * 0.2), size.height * 0.5, paint);
  }

  @override
  //1초에 60프레임이 도는데 그게 도는동안 뒷배경도 다시 그리느냐 마느냐~
  bool shouldRepaint(CustomPainter oldDelegate) {
    //다시 그리지 않는다
    return false;
  }
}
