import 'package:flutter/material.dart';
import 'register.dart';
import 'home.dart';

class Login extends StatefulWidget{
  @override
  LoginState createState() {
    // TODO: implement createState
    return new LoginState();
  }
}

class LoginState extends State<Login>{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                  }else{
                    Navigator.push(context, 
                    MaterialPageRoute(
                      builder: (context) => Home()
                    )
                  );
                  }
                },
              ),
              RaisedButton(
                child: Text("Login", style: TextStyle(color: Colors.white)),
                elevation: 4.0,
                color: Theme.of(context).accentColor,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  _formKey.currentState.validate();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text("Register New Account", style: TextStyle(color: Colors.blueGrey,)),
                    onPressed: (){
                      Navigator.push(context, 
                        MaterialPageRoute(
                          builder: (context) => Register()
                        )
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }

}