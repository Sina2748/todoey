import 'package:flutter/material.dart';
import 'package:todoey/utils/constants.dart';
import 'dart:math';

double value1 = 0.0;
double value2 = 0.0;
double value3 = 0.0;
double value4 = 0.0;
double value5 = 0.0;
double value6 = 0.0;
double value7 = 0.0;
double value8 = 0.0;

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
                    width: 330,
                    height: 330,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle),
                  ),
                  Container(
                    width: 300,
                    height: 300,
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
              arcSlider(
                valueGiven: value1,
                color: Colors.greenAccent,
                onchange: (value) {
                  setState(() {
                    value1 = value;
                  });
                },
              ),
              arcSlider(
                valueGiven: value2,
                color: Colors.teal,
                onchange: (value) {
                  setState(() {
                    value2 = value;
                  });
                },
              ),
              arcSlider(
                valueGiven: value3,
                color: Colors.cyan,
                onchange: (value) {
                  setState(() {
                    value3 = value;
                  });
                },
              ),
              arcSlider(
                valueGiven: value4,
                color: Colors.indigo,
                onchange: (value) {
                  setState(() {
                    value4 = value;
                  });
                },
              ),
              arcSlider(
                valueGiven: value5,
                color: Colors.deepPurple,
                onchange: (value) {
                  setState(() {
                    value5 = value;
                  });
                },
              ),
              arcSlider(
                valueGiven: value6,
                color: Colors.purple,
                onchange: (value) {
                  setState(() {
                    value6 = value;
                  });
                },
              ),
              arcSlider(
                valueGiven: value7,
                color: Colors.pinkAccent,
                onchange: (value) {
                  setState(() {
                    value7 = value;
                  });
                },
              ),
              arcSlider(
                valueGiven: value8,
                color: Colors.pink,
                onchange: (value) {
                  setState(() {
                    value8 = value;
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

class arcSlider extends StatelessWidget {
  final void Function(double)? onchange;
  final color;
  final valueGiven;

  const arcSlider({
    required this.onchange,
    required this.color,
    required this.valueGiven,
  });

  @override
  Widget build(BuildContext context) {
    final myTextController = TextEditingController();
    return Column(
      children: [
        TextField(
          textAlign: TextAlign.center,
          controller: myTextController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        Slider(
            activeColor: color,
            label: valueGiven.toString(),
            divisions: 20,
            min: 0,
            max: 10,
            value: valueGiven,
            onChanged: onchange),
      ],
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
      ..color = Colors.cyan
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

    final Paint paint7 = Paint()
      ..strokeWidth = 5.0
      ..color = Colors.pink
      ..strokeCap = StrokeCap.round;

    final Paint paint8 = Paint()
      ..strokeWidth = 5.0
      ..color = Colors.pinkAccent
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
          degToRad(-45),
          false);

    final path2 = Path()
      ..moveTo(size.height / 2, size.width / 2)
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * value2 / 10,
            width: size.width * value2 / 10,
          ),
          degToRad(-45),
          degToRad(-45),
          false);

    final path3 = Path()
      ..moveTo(size.height / 2, size.width / 2)
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * value3 / 10,
            width: size.width * value3 / 10,
          ),
          degToRad(-90),
          degToRad(-45),
          false);

    final path4 = Path()
      ..moveTo(size.height / 2, size.width / 2)
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * value4 / 10,
            width: size.width * value4 / 10,
          ),
          degToRad(-135),
          degToRad(-45),
          false);

    final path5 = Path()
      ..moveTo(size.height / 2, size.width / 2)
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * value5 / 10,
            width: size.width * value5 / 10,
          ),
          degToRad(-180),
          degToRad(-45),
          false);

    final path6 = Path()
      ..moveTo(size.height / 2, size.width / 2)
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * value6 / 10,
            width: size.width * value6 / 10,
          ),
          degToRad(-225),
          degToRad(-45),
          false);

    final path7 = Path()
      ..moveTo(size.height / 2, size.width / 2)
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * value7 / 10,
            width: size.width * value7 / 10,
          ),
          degToRad(-270),
          degToRad(-45),
          false);

    final path8 = Path()
      ..moveTo(size.height / 2, size.width / 2)
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * value8 / 10,
            width: size.width * value8 / 10,
          ),
          degToRad(-315),
          degToRad(-45),
          false);

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);

    canvas.drawPath(path3, paint3);
    canvas.drawPath(path4, paint4);

    canvas.drawPath(path5, paint5);
    canvas.drawPath(path6, paint6);

    canvas.drawPath(path7, paint7);
    canvas.drawPath(path8, paint8);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }
}
