import 'package:demopunch/Homepage.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Settings',style: TextStyle(color: Color.fromARGB(255, 10, 21, 81)),),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MaterialButton(
              color: Colors.blue,
              child: Text('Logout'),
              onPressed: () {
              Navigator.pop(context);
            },),
          )
        ],
      ),
    );
  }
}