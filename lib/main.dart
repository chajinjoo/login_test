import 'package:flutter/material.dart';
import 'package:logintest/data/join_or_login.dart';
import 'package:logintest/screens/login.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //어떤 데이터를 제공해주는지 데이터 타입 필수 기재
      //여기에 명시된 값은 Provider를 이용해 AuthPage() 모든곳에서 접근 가능하다
      //이놈이 감싼 하위 위젯들은 모두 접근 가능하단 말
      home: ChangeNotifierProvider<JoinOrLogin>.value(
        value: JoinOrLogin(),
        child: AuthPage(),
      ),
    );
  }
}
