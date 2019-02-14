import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() {
    // TODO: implement createState
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "User ID",
                hintText: "User ID",
                icon: Icon(Icons.perm_identity),
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => print(value),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please input value";
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "input your password",
                icon: Icon(Icons.lock),
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please input value";
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "input your password",
                icon: Icon(Icons.lock),
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please input value";
                }
              },
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              splashColor: Colors.blueGrey,
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                _formKey.currentState.validate();
              },
            )
          ]),
        ));
  }
}
