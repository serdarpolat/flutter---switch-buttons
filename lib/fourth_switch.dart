import 'package:flutter/material.dart';

class FourthSwitch extends StatefulWidget {
  @override
  _FourthSwitchState createState() => _FourthSwitchState();
}

class _FourthSwitchState extends State<FourthSwitch> {
  Size get s => MediaQuery.of(context).size;
  int isOn = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: s.width / 2,
      height: s.height / 4,
      color: Color(0xfff5f5f5),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isOn == 0 ? isOn = 1 : isOn = 0;
          });
        },
        child: Container(
          width: s.width / 4,
          height: s.width / 4 * 134 / 266,
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: s.width / 4,
                    height: s.width / 4 * 134 / 266,
                    decoration: BoxDecoration(
                      color: Color(0xff2C2C2C),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Stack(
                      overflow: Overflow.clip,
                      children: <Widget>[
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 360),
                          top: -s.width / 16,
                          left: s.width / 4 - s.width / 4 * isOn,
                          child: Container(
                            width: s.width / 4,
                            height: s.width / 4,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: ((s.height / 4) - s.width / 4 * 134 / 266) / 2 + 8,
                left: (s.width / 2 - s.width / 4) / 2 + 8,
                child: Container(
                  width: s.width / 4 * 134 / 266 - 16,
                  height: s.width / 4 * 134 / 266 - 16,
                  decoration: BoxDecoration(
                    color: Color(0xff2C2C2C),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned(
                top: ((s.height / 4) - s.width / 4 * 134 / 266) / 2 + 8,
                right: (s.width / 2 - s.width / 4) / 2 + 8,
                child: Container(
                  width: s.width / 4 * 134 / 266 - 16,
                  height: s.width / 4 * 134 / 266 - 16,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
