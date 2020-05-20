import 'package:flutter/material.dart';

class SecondSwitch extends StatefulWidget {
  @override
  _SecondSwitchState createState() => _SecondSwitchState();
}

class _SecondSwitchState extends State<SecondSwitch> {
  int isOn = 1;
  Size get s => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: s.width / 2,
      height: s.height / 4,
      color: Color(0xfff5f5f5),
      child: Center(
        child: Container(
          width: s.width / 4,
          height: (s.width / 4) * 120 / 236,
          decoration: BoxDecoration(
            color: Color(0xffDDE1E3),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: s.width / 4 - 12,
                  height: (s.width / 4) * 120 / 236 - 12,
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                left: 6,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 480),
                  curve: Curves.bounceOut,
                  width: s.width / 8 - 12 + s.width / 8 * isOn,
                  height: (s.width / 4) * 120 / 236 - 12,
                  decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 480),
                curve: Curves.bounceOut,
                top: 4,
                left: 4 + (s.width / 4) / 2 * isOn,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isOn == 0 ? isOn = 1 : isOn = 0;
                    });
                  },
                  child: Container(
                    width: (s.width / 4) * 120 / 236 - 8,
                    height: (s.width / 4) * 120 / 236 - 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xfff5f5f5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 5,
                        ),
                      ],
                    ),
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
