import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

//ChangeNotifier Provider 은 해당 오브젝트가 변경될 때마다 알림메세지를 받음
class JoinOrLogin extends ChangeNotifier {
  //값이 변경되지 않게끔 프라이빗 타입으로 선언
  bool _isJoin = false;

  bool get isJoin => _isJoin;

  //실행될때마다 값을 변경해줌
  void toggle() {
    _isJoin = !_isJoin;
    //데이터가 변경되면 사용하고있던 위젯들에게 알림을 보냄
    notifyListeners();
  }
}
