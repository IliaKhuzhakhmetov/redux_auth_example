import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProtectedScreen extends StatelessWidget {
  final SharedPreferences prefs;

  ProtectedScreen({required this.prefs});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Protected screen',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Protected Screen'),
          ),
          body: Padding(
            padding: EdgeInsets.all(23.2),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Protected screen',
                    style: TextStyle(color: Colors.black),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      prefs.remove('token');
                      Navigator.pop(context);
                    },
                    child: Text('Logout'),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
