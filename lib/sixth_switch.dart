import 'dart:math';

import 'package:flutter/material.dart';

class SixthSwitch extends StatefulWidget {
  @override
  _SixthSwitchState createState() => _SixthSwitchState();
}

class _SixthSwitchState extends State<SixthSwitch>
    with SingleTickerProviderStateMixin {
  AnimationController _ctrl;
  Size get s => MediaQuery.of(context).size;
  int isOn = 0;
  bool changeColor = false;
  double width = 70 - 24.0;
  AlignmentGeometry align = Alignment.centerLeft;

  @override
  void initState() {
    super.initState();
    _ctrl =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1600))
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
    return Container(
      width: s.width / 2,
      height: s.height / 4,
      color: Color(0xffFEFEFE),
      child: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 360),
          width: s.width / 2 * 0.6,
          height: 70.0,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xfffefefe),
            border: Border.all(
              color: isOn == 0 ? Color(0xffd6d6d6) : Colors.transparent,
              width: 2 * (1.0 - isOn),
            ),
            boxShadow: [
              BoxShadow(
                color: isOn == 0 ? Colors.transparent : Color(0xffd6d6d6),
                offset: Offset(0, 10),
                blurRadius: 16,
              ),
            ],
          ),
          child: Align(
            alignment: align,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isOn == 0 ? isOn = 1 : isOn = 0;
                  width = s.width / 2 * 0.6 - 24;
                });

                Future.delayed(Duration(milliseconds: 360), () {
                  setState(() {
                    width = 70 - 24.0;
                    changeColor = !changeColor;
                    isOn == 0
                        ? align = Alignment.centerLeft
                        : align = Alignment.centerRight;
                  });
                });

                isOn == 1
                    ? Future.delayed(Duration(milliseconds: 720), () {
                        _ctrl.repeat();
                      })
                    : _ctrl.reset();
              },
              child: AnimatedBuilder(
                animation: _ctrl,
                builder: (context, child) => child,
                child: Transform.rotate(
                  angle: pi * _ctrl.value,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 360),
                    width: width,
                    height: 70 - 24.0,
                    decoration: BoxDecoration(
                      // color: Color(0xfffefefe),
                      gradient: RadialGradient(
                        colors: [
                          !changeColor ? Color(0xfffefefe) : Color(0xff00FF00),
                          !changeColor ? Color(0xfffefefe) : Color(0xff43EB46),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: !changeColor
                              ? Color(0xffd6d6d6)
                              : Color(0xff43EB46).withOpacity(0.8),
                          offset: Offset(0, 0),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
