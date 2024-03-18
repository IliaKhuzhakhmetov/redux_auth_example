import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Home Page')),
        body: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: new Text(
                  'OPEN PROTECTED',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () => Navigator.pushNamed(context, '/protected'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
