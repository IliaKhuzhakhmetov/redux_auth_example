import 'package:flutter/material.dart';

import '../models/model.dart';

typedef OnSaveCallback = Function(
    String username, String email, String password, BuildContext context);

class LoginScreen extends StatefulWidget {
  final OnSaveCallback onSave;
  final Login login;

  LoginScreen({super.key, required this.onSave, required this.login});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form_key = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Form(
          key: _form_key,
          child: Container(
            padding: EdgeInsets.all(23.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Text('HELLO'),
                SizedBox(height: 20),
                Text("Let's start!"),
                SizedBox(height: 5),
                Text(
                  widget.login.error,
                  style: TextStyle(color: Colors.redAccent),
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: new Text(
                        widget.login.loading ? 'Loading' : 'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: widget.login.loading
                          ? null
                          : () {
                              if (_form_key.currentState!.validate()) {
                                _form_key.currentState?.save();
                                widget.onSave(
                                  _usernameController.text,
                                  _emailController.text,
                                  _passwordController.text,
                                  context,
                                );
                              }
                            },
                    ))
              ],
            ),
          ),
        ));
  }
}
