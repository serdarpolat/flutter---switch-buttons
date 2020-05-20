import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ThirdSwitch extends StatefulWidget {
  @override
  _ThirdSwitchState createState() => _ThirdSwitchState();
}

class _ThirdSwitchState extends State<ThirdSwitch>
    with SingleTickerProviderStateMixin {
  AnimationController _ctrl;

  int isOn = 0;
  int face = 0;

  Size get s => MediaQuery.of(context).size;

  @override
  void initState() {
    super.initState();
    _ctrl =
        AnimationController(vsync: this, duration: Duration(milliseconds: 320))
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, child) => child,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Interval(0.8, 1.0),
        width: s.width / 2,
        height: s.height / 4,
        color: isOn == 0 ? Color(0xff22BAA8) : Color(0xff6E6E6E),
        child: Stack(
          children: <Widget>[
            Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 380),
                curve: Interval(0.3, 1.0),
                width: s.width / 4,
                height: s.width / 4 * 5 / 16,
                decoration: BoxDecoration(
                  color: isOn == 0 ? Color(0xff6DDE80) : Color(0xffA5A5A5),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.6),
                      offset: Offset(0, 2),
                      blurRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0xff6E6E6E),
                      offset: Offset(0, -2),
                      blurRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 240),
              curve: Curves.easeInBack,
              top: ((s.height / 4) - (s.width / 5.6 * 5 / 6)) / 2,
              left: isOn == 0 ? 40 : s.width / 2 - (s.width / 5.6) - 40,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isOn == 0 ? isOn = 1 : isOn = 0;
                  });

                  setState(() {
                    face = 1;
                  });

                  if (_ctrl.status == AnimationStatus.completed)
                    _ctrl.reverse();
                  else
                    _ctrl.forward();

                  Future.delayed(Duration(milliseconds: 400), () {
                    setState(() {
                      face = 0;
                    });
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 600),
                  curve: Interval(0.8, 1.0),
                  width: s.width / 5.6,
                  height: (s.width / 5.6 * 5 / 6),
                  decoration: BoxDecoration(
                    color: isOn == 0 ? Color(0xffD1FDDC) : Color(0xffE7E7E7),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(0, 8),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 120),
                        top: face == 0 ? 20 : 38,
                        left: 12,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 120),
                        top: face == 0 ? 20 : 38,
                        right: 12,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 120),
                        top: _ctrl.value == 1 ? 52 : face == 0 ? 44 : 14,
                        left: (s.width / 5.6 - 24) / 2,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..rotateX(
                                pi / lerpDouble(1, 180, (1 - _ctrl.value))),
                          child: Container(
                            width: 24,
                            height: 24 * 92 / 226,
                            child: Image.asset(
                              "assets/images/sml.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
