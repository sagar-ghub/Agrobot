import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  String pwdValidator(String password) {
    if (password.length > 5) {
      return null;
    } else {
      return 'Please enter long enough password';
    }
  }

  @override
  void initState() {
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[Icon(Icons.person), Text('LOGIN PAGE')],
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Form(
                child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String email) {
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (String password) {
                    return null;
                  },
                ),
                SizedBox(height: 10),
                MaterialButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.verified_user),
                      Text('LOGIN')
                    ],
                  ),
                  onPressed: () async {
                    FirebaseUser  user;
                    try{
                    user =(await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text)).user  ;
                    }catch(e){
                      print(e.toString());

                    }
                    finally{
                      if (user!=null) {
                        Navigator.pushNamed(context,'/home');
                      } else {
                    
                      }
                    }
                  } ,
                ),
                SizedBox(height: 10),
                Text('NEW USER!!Click this to register'),
                MaterialButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.settings),
                        Text('REGISTER')
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    })
              ],
            ))));
  }
}
