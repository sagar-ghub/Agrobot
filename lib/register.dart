import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _passwordConfirmationController;
  TextEditingController _cropName;

  @override
  void initState() {
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
    _passwordConfirmationController = new TextEditingController();
    _cropName = new TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
        children: <Widget>[
          Icon(Icons.verified_user),
          Text("Register Page")
        ],
      )

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
                          borderRadius: BorderRadius.circular(32)
                        )
                      ),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String email){
                        return null;
                      },
                    ),
                    SizedBox(height:10),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32)
                          )
                      ),
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (String password){
                        return null;
                      },
                    ),
                    SizedBox(height:10),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32)
                          )
                      ),
                      controller: _passwordConfirmationController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (String passwordConfirmation){
                        return null;
                      },
                    ),
                    SizedBox(height:10),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Crop Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32)
                          )
                      ),
                      controller: _cropName,
                      keyboardType: TextInputType.text,
                      validator: (String passwordConfirmation){
                        return null;
                      },
                    ),
                    SizedBox(height:30),
                    MaterialButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.verified_user),
                          Text('Register')
                        ],
                      ),
                      onPressed: (){
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text).then(
                            (user) => Firestore.instance.collection('users')
                                              .document(user.user.uid)
                                              .setData({
                              'email':user.user.email,
                              'cropNames' : [_cropName.text]
                                              })
                        );
                      },
                    )
                  ],
                )
            )
        )
    );
  }
}
