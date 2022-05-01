import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoey/utils/constants.dart';
import 'dart:math';
import 'add_task_screen.dart';

double value1 = 0.0;
double value2 = 0.0;
double value3 = 0.0;
double value4 = 0.0;
double value5 = 0.0;
double value6 = 0.0;
double value7 = 0.0;
double value8 = 0.0;

String lable1 = 'سلامتی';
String lable2 = 'دین';
String lable3 = 'تفریح';
String lable4 = 'پول';
String lable5 = 'درس';
String lable6 = 'عشق';
String lable7 = 'خانواده';
String lable8 = 'رشد';

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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 9),
                child: Column(
                  children: [
                    arcSlider(
                      onLablePress: () {
                        setState(() {
                          lable1 = 'value';
                        });
                      },
                      silderLable: lable1,
                      valueGiven: value1,
                      color: Colors.greenAccent,
                      onchange: (value) {
                        setState(() {
                          value1 = value;
                        });
                      },
                    ),
                    arcSlider(
                      onLablePress: () {
                        setState(() {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: EditLable(a: lable2),
                              ),
                            ),
                          );
                        });
                      },
                      silderLable: lable2,
                      valueGiven: value2,
                      color: Colors.teal,
                      onchange: (value) {
                        setState(() {
                          value2 = value;
                        });
                      },
                    ),
                    arcSlider(
                      onLablePress: () {
                        setState(() {
                          lable1 = 'value';
                        });
                      },
                      silderLable: lable3,
                      valueGiven: value3,
                      color: Colors.cyan,
                      onchange: (value) {
                        setState(() {
                          value3 = value;
                        });
                      },
                    ),
                    arcSlider(
                      onLablePress: () {
                        setState(() {
                          lable1 = 'value';
                        });
                      },
                      silderLable: lable4,
                      valueGiven: value4,
                      color: Colors.indigo,
                      onchange: (value) {
                        setState(() {
                          value4 = value;
                        });
                      },
                    ),
                    arcSlider(
                      onLablePress: () {
                        setState(() {
                          lable1 = 'value';
                        });
                      },
                      silderLable: lable5,
                      valueGiven: value5,
                      color: Colors.deepPurple,
                      onchange: (value) {
                        setState(() {
                          value5 = value;
                        });
                      },
                    ),
                    arcSlider(
                      onLablePress: () {
                        setState(() {
                          lable1 = 'value';
                        });
                      },
                      silderLable: lable6,
                      valueGiven: value6,
                      color: Colors.purple,
                      onchange: (value) {
                        setState(() {
                          value6 = value;
                        });
                      },
                    ),
                    arcSlider(
                      onLablePress: () {
                        setState(() {
                          lable1 = 'value';
                        });
                      },
                      silderLable: lable7,
                      valueGiven: value7,
                      color: Colors.pink,
                      onchange: (value) {
                        setState(() {
                          value7 = value;
                        });
                      },
                    ),
                    arcSlider(
                      onLablePress: () {
                        setState(() {
                          lable1 = 'value';
                        });
                      },
                      silderLable: lable8,
                      valueGiven: value8,
                      color: Colors.pinkAccent,
                      onchange: (value) {
                        setState(() {
                          value8 = value;
                        });
                      },
                    ),
                  ],
                ),
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
  final String silderLable;
  final void Function()? onLablePress;

  const arcSlider({
    required this.onchange,
    required this.color,
    required this.valueGiven,
    required this.silderLable,
    required this.onLablePress,
  });

  @override
  Widget build(BuildContext context) {
    final myTextController = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: Slider(
              activeColor: color,
              label: valueGiven.toString(),
              divisions: 20,
              min: 0,
              max: 10,
              value: valueGiven,
              onChanged: onchange),
        ),
        Container(
          child: TextButton(
            onPressed: onLablePress,
            child: Text(
              silderLable,
              style: GoogleFonts.harmattan(
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class EditLable extends StatelessWidget {
  final a;
  const EditLable({required this.a});

  @override
  Widget build(BuildContext context) {
    String? newLable;
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Container(
        padding: EdgeInsets.only(
          left: 40,
          right: 40,
          top: 20,
        ),
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'چه کار دیگری باید انجام شود؟',
              textAlign: TextAlign.center,
              style: GoogleFonts.lemonada(
                  textStyle: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.w600,
              )),
            ),
            TextField(
              onChanged: (e) {
                newLable = e;
                print(e);
              },
              textAlign: TextAlign.center,
              autofocus: true,
            ),
            FlatButton(
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                lable2 = newLable!;
                // addNewTaskcallback(newTask);
                // context.read<TaskData>().addTask(newTask!, user_id, false);
                // context.read<TaskData>().addCloudTasksToList(user_id);
                Navigator.pop(context);
              },
              child: Text(
                'اضافه کن',
                style: GoogleFonts.lemonada(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onSecondary,
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

    void arcLable(var varName, int arcStart, arcName) {
      final textPainter = TextPainter(
          text: TextSpan(
              text: '$arcName',
              style: GoogleFonts.harmattan(
                  textStyle: TextStyle(fontSize: varName * 2))),
          textDirection: TextDirection.rtl);
      textPainter.layout(minWidth: 0, maxWidth: size.width);

      final xCenter = (size.width - textPainter.width) / 2;
      final yCenter = (size.height - textPainter.height) / 2;
      final df = Offset.fromDirection(degToRad(arcStart - 22.5), varName * 10);
      final offset = Offset(xCenter, yCenter) + df;

      textPainter.paint(canvas, offset);
    }

    arcLable(value1, 0, lable1);
    arcLable(value2, -45, lable2);
    arcLable(value3, -90, lable3);
    arcLable(value4, -135, lable4);
    arcLable(value5, -180, lable5);
    arcLable(value6, -225, lable6);
    arcLable(value7, -270, lable7);
    arcLable(value8, -315, lable8);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }
}
