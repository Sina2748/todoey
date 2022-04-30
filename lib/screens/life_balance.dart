import 'package:flutter/material.dart';
import 'package:todoey/utils/constants.dart';
import 'dart:math';

double value1 = 0.0;
double value2 = 0.0;
double value3 = 0.0;
double value4 = 0.0;
double value5 = 0.0;
double value6 = 0.0;

class lifeBalanceScreen extends StatefulWidget {
  const lifeBalanceScreen({Key? key}) : super(key: key);

  @override
  State<lifeBalanceScreen> createState() => _lifeBalanceScreenState();
}

class _lifeBalanceScreenState extends State<lifeBalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradiantAppBar(pageTitle: 'چرخه تعادل زندگی'),
      // backgroundColor: Theme.of(context).colorScheme.primary,
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,

      body: Container(
        decoration: kBackgroundImage,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(6),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 260,
                    height: 260,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    child: CustomPaint(
                      painter: LinePainter(),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ]),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Slider(
                activeColor: Colors.greenAccent,
                label: value1.toString(),
                divisions: 20,
                min: 0,
                max: 10,
                value: value1,
                onChanged: (value) {
                  setState(() {
                    value1 = value;
                  });
                },
              ),
              Slider(
                activeColor: Colors.teal,
                label: value2.toString(),
                divisions: 20,
                min: 0,
                max: 10,
                value: value2,
                onChanged: (value) {
                  setState(() {
                    value2 = value;
                  });
                },
              ),
              Slider(
                activeColor: Colors.blue,
                label: value3.toString(),
                divisions: 20,
                min: 0,
                max: 10,
                value: value3,
                onChanged: (value) {
                  setState(() {
                    value3 = value;
                  });
                },
              ),
              Slider(
                activeColor: Colors.indigo,
                label: value4.toString(),
                divisions: 20,
                min: 0,
                max: 10,
                value: value4,
                onChanged: (value) {
                  setState(() {
                    value4 = value;
                  });
                },
              ),
              Slider(
                activeColor: Colors.deepPurple,
                label: value5.toString(),
                divisions: 20,
                min: 0,
                max: 10,
                value: value5,
                onChanged: (value) {
                  setState(() {
                    value5 = value;
                  });
                },
              ),
              Slider(
                activeColor: Colors.purple,
                label: value6.toString(),
                divisions: 20,
                min: 0,
                max: 10,
                value: value6,
                onChanged: (value) {
                  setState(() {
                    value6 = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint1 = Paint()
      ..strokeWidth = 5.0
      ..color = Colors.greenAccent
      ..strokeCap = StrokeCap.round;

    final Paint paint2 = Paint()
      ..strokeWidth = 5.0
      ..color = Colors.teal
      ..strokeCap = StrokeCap.round;

    final Paint paint3 = Paint()
      ..strokeWidth = 5.0
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round;

    final Paint paint4 = Paint()
      ..strokeWidth = 5.0
      ..color = Colors.indigo
      ..strokeCap = StrokeCap.round;

    final Paint paint5 = Paint()
      ..strokeWidth = 5.0
      ..color = Colors.deepPurple
      ..strokeCap = StrokeCap.round;

    final Paint paint6 = Paint()
      ..strokeWidth = 5.0
      ..color = Colors.purple
      ..strokeCap = StrokeCap.round;

    double degToRad(double deg) => deg * (pi / 180.0);

    final path1 = Path()
      ..moveTo(size.height / 2, size.width / 2)
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * value1 / 10,
            width: size.width * value1 / 10,
          ),
          degToRad(0),
          degToRad(-60),
          false);

    final path2 = Path()
      ..moveTo(size.height / 2, size.width / 2)
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * value2 / 10,
            width: size.width * value2 / 10,
          ),
          degToRad(-60),
          degToRad(-60),
          false);

    final path3 = Path()
      ..moveTo(size.height / 2, size.width / 2)
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * value3 / 10,
            width: size.width * value3 / 10,
          ),
          degToRad(-120),
          degToRad(-60),
          false);

    final path4 = Path()
      ..moveTo(size.height / 2, size.width / 2)
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * value4 / 10,
            width: size.width * value4 / 10,
          ),
          degToRad(-180),
          degToRad(-60),
          false);

    final path5 = Path()
      ..moveTo(size.height / 2, size.width / 2)
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * value5 / 10,
            width: size.width * value5 / 10,
          ),
          degToRad(-240),
          degToRad(-60),
          false);

    final path6 = Path()
      ..moveTo(size.height / 2, size.width / 2)
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * value6 / 10,
            width: size.width * value6 / 10,
          ),
          degToRad(-300),
          degToRad(-60),
          false);

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);

    canvas.drawPath(path3, paint3);
    canvas.drawPath(path4, paint4);

    canvas.drawPath(path5, paint5);
    canvas.drawPath(path6, paint6);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }
}
