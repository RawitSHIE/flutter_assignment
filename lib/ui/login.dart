import 'package:flutter/material.dart';
import 'register.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return new LoginState();
  }
}

class authen {
  String user = "admin";
  String pass = "1234";
}

class LoginState extends State<Login> {
  BuildContext context1;

  TextEditingController usercontrol = TextEditingController();
  TextEditingController passcontrol = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  authen auThen = authen();

  TextFormField userid() {
    return TextFormField(
      controller: usercontrol,
      decoration: InputDecoration(
        labelText: "User ID",
        hintText: "User ID",
        icon: Icon(Icons.perm_identity),
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => print(value),
    );
  }

  TextFormField password() {
    return TextFormField(
      controller: passcontrol,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "input your password",
        icon: Icon(Icons.lock),
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
    );
  }

  Row register() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton(
          child: Text("Register New Account",
              style: TextStyle(
                color: Colors.blueGrey,
              )),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Register()));
          },
        ),
      ],
    );
  }

  RaisedButton login() {
    return RaisedButton(
      child: Text("Login", style: TextStyle(color: Colors.white)),
      elevation: 4.0,
      color: Theme.of(context).accentColor,
      splashColor: Colors.blueGrey,
      onPressed: () {
        if (usercontrol.text == '' || passcontrol.text == '') {
          _scaffoldKey.currentState.showSnackBar(new SnackBar(
            content: Text("กรุณาระบุ user or password"),
          ));
        } else if (auThen.user == usercontrol.text &&
            auThen.pass == passcontrol.text) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          _scaffoldKey.currentState.showSnackBar(new SnackBar(
            content: Text("user or password ไม่ถูกต้อง"),
          ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    context1 = context;
    return Scaffold(
      key:_scaffoldKey,
        body: Form(
      key: _formKey,
      child: Center(
        child: ListView(
          padding: EdgeInsets.all(20.0),
          shrinkWrap: true,
          children: <Widget>[
            Image.asset(
              "images/flutter.png",
              height: 200,
            ),
            userid(),
            password(),
            login(),
            register()
          ],
        ),
      ),
    ));
  }
}
