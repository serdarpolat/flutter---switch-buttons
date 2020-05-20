import 'dart:ui';

import 'package:flutter/material.dart';

class FifthSwitch extends StatefulWidget {
  @override
  _FifthSwitchState createState() => _FifthSwitchState();
}

class _FifthSwitchState extends State<FifthSwitch> {
  Size get s => MediaQuery.of(context).size;
  int isOn = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: s.width / 2,
      height: s.height / 4,
      color: Color(0xfff5f5f5),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: (s.height / 4 - s.width / 5 * 0.5) / 2,
            left: (s.width / 2 - s.width / 5) / 2,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 360),
              width: s.width / 5,
              height: s.width / 5 * 0.5,
              decoration: BoxDecoration(
                color: isOn == 0 ? Color(0xff2c2c2c) : Color(0xffdddddd),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 360),
            top: (s.height / 4 - s.width / 6) / 2,
            left: s.width / 6 +
                lerpDouble(s.width / 14, -s.width / 14, isOn.toDouble()),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isOn == 0 ? isOn = 1 : isOn = 0;
                });
              },
              child: Container(
                width: s.width / 6,
                height: s.width / 6,
                child: Center(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 360),
                    width: lerpDouble(10, s.width / 10 - 6, isOn.toDouble()),
                    height: s.width / 10 - 6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color:
                            isOn == 0 ? Color(0xff2c2c2c) : Color(0xffdddddd),
                        width: 5,
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 8),
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
