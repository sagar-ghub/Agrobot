import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String pwdValidator (String password){
    if(password.length>5) {
      return null;
    } else {
      return 'Please enter long enough password';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  child:Text('Go to Register'),
                  onPressed: (){
                    Navigator.pushNamed(context, '/register');
                  },
                )
              ],
            )


    );
  }
}
