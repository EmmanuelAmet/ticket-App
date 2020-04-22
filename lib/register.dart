import 'package:flutter/material.dart';

import 'homePage.dart';


class userRegisterPage extends StatefulWidget {
  @override
  _userRegisterPageState createState() => _userRegisterPageState();
}

class _userRegisterPageState extends State<userRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register',
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: "Quando"
          ),),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.deepOrange,
                child: Icon(Icons.ac_unit, size: 120.0, color: Colors.white,),
                radius: 80.0,
              ),
            ),
            Text('TICKET\'O', textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Alike',
                  fontSize: 30.0,
                  decoration: TextDecoration.none,
                  color: Colors.deepOrange
              ),),
            Blink(
              duration: const Duration(milliseconds: 1000),
              child: new Text(
                'USER REGISTRATION',
                style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: "Alike",
                    color: Colors.black
                ),),
            ),
            Divider(),
            Text('Name:',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontFamily: "Alike"
              ),),
                TextField(
                ),

            Text('Email:',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontFamily: "Alike"
              ),),
            TextField(
            )

          ],
        ),
      ),
    );
  }
}
