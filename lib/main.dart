import 'package:flutter/material.dart';
import 'package:switch_btn/fifth_switch.dart';
import 'package:switch_btn/first_switch.dart';
import 'package:switch_btn/fourth_switch.dart';
import 'package:switch_btn/second_switch.dart';
import 'package:switch_btn/seventh_switch.dart';
import 'package:switch_btn/sixth_switch.dart';
import 'package:switch_btn/third_switch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            child: FirstSwitch(),
          ),
          Row(
            children: <Widget>[
              SecondSwitch(),
              ThirdSwitch(),
            ],
          ),
          Row(
            children: <Widget>[
              FourthSwitch(),
              FifthSwitch(),
            ],
          ),
          Row(
            children: <Widget>[
              SixthSwitch(),
              SeventhSwitch(),
            ],
          ),
        ],
      ),
    );
  }
}
