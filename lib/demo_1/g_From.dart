import 'package:flutter/material.dart';

class FromDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('FormDemo'),
        elevation: 0.0,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password; //声明变量
  bool autovalidate = false; //默认不检查

  String validateUsername(value) {
    //参数校验
    if (value.isEmpty) {
      return 'Username is required.';
    }
    return null;
  }

  String validatePassword(value) {
    //参数校验
    if (value.isEmpty) {
      return 'Password is required.';
    }
    return null;
  }

  void submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      debugPrint('用户名: $username');
      debugPrint('密码: $password');
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('登录中...'),
      ));
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: registerFormKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              //用户名
              decoration: InputDecoration(
                labelText: 'Username',
                helperText: '',
              ),
              onSaved: (value) {
                username = value;
              },
              validator: validateUsername,
              autovalidate: autovalidate,
            ),
            TextFormField(
              //密码
              decoration: InputDecoration(
                labelText: 'Password',
                helperText: '',
              ),
              onSaved: (value) {
                password = value;
              },
              validator: validatePassword,
              autovalidate: autovalidate,
            ),
            SizedBox(
              height: 32.0,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text('登录', style: TextStyle(color: Colors.white)),
                  elevation: 0.0,
                  onPressed: submitRegisterForm),
            )
          ],
        ));
  }
}
