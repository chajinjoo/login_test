import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  // 폼에 부여할 수 있는 유니크한 글로벌 키를 생성한다.
  // MyCustomFormState의 키가 아닌 FormState의 키를 생성해야함을 유의
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //context로 정보를 참조해서 MediaQuery 라이브러리를 통해 해당 사이즈를 가져옴
    //final 키워드로 수정불가하게 만듦
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CustomPaint(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _logoImage,
              Stack(
                children: <Widget>[
                  _inputForm(size),
                  _authButton(size),
                ],
              ),
              SizedBox(height: size.height * 0.1),
              Text('Don\'t Have an Account? Create One'),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ],
      ),
    );
  }

  //Logo Image
  //받는 인자값이 없다면 get 키워드로 생성한다. 가져올때도 () 괄호 생략
  Widget get _logoImage => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 50, right: 50),
          child: FittedBox(
            fit: BoxFit.contain,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/bear.gif'),
            ),
          ),
        ),
      );

  //Login Button
  Widget _authButton(Size size) => Positioned(
        left: size.width * 0.15,
        right: size.width * 0.15,
        bottom: 0,
        child: SizedBox(
          height: 50,
          child: RaisedButton(
            color: Colors.blue,
            child: Text(
              'Login',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            //onPressed 가 null 값이면 버튼 색상 못바꿈
            onPressed: () {
              //폼에 작성한게 유효하다면 (validator로 검증) 실행
              if (_formKey.currentState.validate()) {
                print(_passwordController.text.toString());
              }
            },
          ),
        ),
      );

  //Input Form
  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        //둥글게~~
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
            right: 12.0,
            top: 12.0,
            bottom: 32.0,
          ),
          // 폼 위젯 생성
          // 폼 위젯은 컨테이너처럼 동작하면서, 복수의 폼 필드를 그룹화하고 적합성을 확인함
          child: Form(
            //유저가 텍스트필드를 통해 폼을 작성하면 상태가 변하는데
            //변한 상태를 _formKey 를 통해 가져온다.
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email', icon: Icon(Icons.account_circle)),
                  //제대로 폼이 작성되었는지 확인해줌
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please input correct Email.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password', icon: Icon(Icons.vpn_key)),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please input correct Password.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                Text('Forgot Password'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
