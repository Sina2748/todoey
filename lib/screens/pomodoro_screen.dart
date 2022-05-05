import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/utils/constants.dart';
import 'dart:math';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradiantAppBar(pageTitle: 'پومودورو'),
      body: Container(
        width: double.infinity,
        decoration: kBackgroundImage,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(6),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  //---- Shadow
                  Container(
                    width: 330,
                    height: 330,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle),
                  ),
                  //---- Painting the Arc
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(-2, 4),
                          ),
                        ]),
                    child: CustomPaint(
                      painter: ClockPainter(),
                    ),
                  ),
                  Container(
                    child: Text(
                      '12:36',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 10),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  //---- Shadow
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.tealAccent.withOpacity(0.2),
                        shape: BoxShape.circle),
                  ),
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment(0.05, -0.08),
                          colors: [Colors.white, Color(0xfff1f1f1)],
                          stops: [0.5, 0.9],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: Offset(-2, 4),
                          ),
                        ]),
                    child: CustomPaint(
                      painter: ClockPainter(),
                    ),
                  ),
                  Container(
                    child: Icon(
                      Icons.pause,
                      color: Colors.teal[700],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      //---- Shadow
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.rectangle),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              colors: [Colors.white, Color(0xfff1f1f1)],
                              stops: [0.1, 0.9],
                            ),
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(-1, 3),
                              ),
                            ]),
                        child: Icon(
                          Icons.add_box_rounded,
                          color: Colors.teal[700],
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      //---- Shadow
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.rectangle),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              colors: [Colors.white, Color(0xfff1f1f1)],
                              stops: [0.1, 0.9],
                            ),
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(-1, 3),
                              ),
                            ]),
                        child: Icon(
                          Icons.anchor_sharp,
                          color: Colors.teal[700],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//---- Painting the Clock
class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double degToRad(double deg) => deg * (-pi / 180.0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }
}
