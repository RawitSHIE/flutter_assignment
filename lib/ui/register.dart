import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() {
    // TODO: implement createState
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  TextEditingController new_user = TextEditingController();
  TextEditingController con_pass = TextEditingController();
  TextEditingController new_pass = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextFormField newuser() {
    return TextFormField(
      controller: new_user,
      decoration: InputDecoration(
        labelText: "email",
        hintText: "sample@email.com",
        icon: Icon(Icons.perm_identity),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextFormField newpass() {
    return TextFormField(
      controller: new_pass,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Input your password",
        icon: Icon(Icons.lock),
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
    );
  }

  TextFormField conpass() {
    return TextFormField(
      controller: con_pass,
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Input your password",
        icon: Icon(Icons.lock),
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
    );
  }

  RaisedButton register() {
    return RaisedButton(
      color: Theme.of(context).accentColor,
      splashColor: Colors.blueGrey,
      child: Text(
        "Register",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if(new_user.text == "admin"){
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text("user นี้มีอยู่ในระบบแล้ว"),
          ));
        }
        else if (con_pass.text == new_pass.text && new_user.text != "") {
          Navigator.pop(context);
        }else if(con_pass.text == "" || new_pass.text == "" || new_user.text == ""){
          _scaffoldKey.currentState.showSnackBar(
            new SnackBar(
              content: Text("กรุณาระบุข้อมูลให้ครบถ้วน"),
            )
          );
        }else if(con_pass.text != new_pass.text && new_user.text != ""){
          _scaffoldKey.currentState.showSnackBar(
            new SnackBar(
              content: Text("Password didn't match"),
            )
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(20.0),
                children: <Widget>[
                  newuser(),
                  newpass(),
                  conpass(),
                  register(),
                ]),
          ),
        ));
  }
}
