import 'package:flutter/material.dart';
import 'dart:async';
import 'homePage.dart';

class loadingView extends StatefulWidget {
  @override
  _loadingViewState createState() => _loadingViewState();
}

class _loadingViewState extends State<loadingView> {
  @override

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => homePage(),
      ));
    });
  }
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
