import 'package:flutter/material.dart';
import 'home.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() {
    // TODO: implement createState
    return RegisterState();
  }
}

class RegisterState extends State<Register> {

  TextEditingController newuser = TextEditingController();
  TextEditingController con_pass = TextEditingController();
  TextEditingController newpass = TextEditingController();

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
              controller: newuser,
              decoration: InputDecoration(
                labelText: "email",
                hintText: "sample@email.com",
                icon: Icon(Icons.perm_identity),
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => print(value),
            ),
            TextFormField(
              controller: newpass,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Input your password",
                icon: Icon(Icons.lock),
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
            TextFormField(
              controller: con_pass,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                hintText: "Input your password",
                icon: Icon(Icons.lock),
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              splashColor: Colors.blueGrey,
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (con_pass.text == newpass.text && newuser.text != ""){
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => Home())
                    );
                }
              },
            )
          ]),
        ));
  }
}
