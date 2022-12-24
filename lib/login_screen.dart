// A login screen, harvested from 
// https://stackoverflow.com/questions/66613582/screen-not-updating-after-using-setstate-flutter

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";

class AuthForm extends StatefulWidget {
  AuthForm({required Key key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  var isLogIn = true;
  var _userEmail = '';
  var _userPass = '';
  var _userUsername = '';
  final _formKey = GlobalKey<FormState>();
  void _trySubmit() {
    final bool? isValid = _formKey.currentState?.validate();

    FocusScope.of(context).unfocus();

    if (isValid!) {
      _formKey.currentState?.save();

      print(_userEmail);
      print(_userPass);
      print(_userUsername);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 20,
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Email"),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains("@")) {
                        return "Please Enter a Valid Email";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userEmail = value!;
                    },
                  ),
                  if (!isLogIn)
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(labelText: "User Name"),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 4) {
                          return "Please Enter Atleast 4 Charecter";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _userUsername = value!;
                      },
                    ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return "Please Enter Atleast 7 Charecter";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userPass = value!;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: _trySubmit,
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        isLogIn ? "Log In" : "Sign Up",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogIn = !isLogIn;
                        if (kDebugMode) {
                          print(isLogIn);
                        }
                      });
                    },
                    child: Text(isLogIn
                        ? "Create New Account"
                        : "I Already have a Account"),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
