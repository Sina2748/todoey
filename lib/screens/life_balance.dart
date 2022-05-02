import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoey/utils/constants.dart';
import 'dart:math';

double value1 = 10.0;
double value2 = 10.0;
double value3 = 10.0;
double value4 = 10.0;
double value5 = 10.0;
double value6 = 10.0;
double value7 = 10.0;
double value8 = 10.0;

List valueList = [
  value1,
  value2,
  value3,
  value4,
  value5,
  value6,
  value7,
  value8
];
String newLabel = 'بدون نام';

String label1 = 'سلامتی';
String label2 = 'دین';
String label3 = 'تفریح';
String label4 = 'پول';
String label5 = 'درس';
String label6 = 'عشق';
String label7 = 'خانواده';
String label8 = 'رشد';

List labelList = [
  label1,
  label2,
  label3,
  label4,
  label5,
  label6,
  label7,
  label8
];

List colorList = [
  Colors.greenAccent,
  Colors.teal,
  Colors.cyan,
  Colors.indigo,
  Colors.deepPurple,
  Colors.purple,
  Colors.pink,
  Colors.pinkAccent
];

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
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    for (int index = 0; index < 8; index++)
                      arcSlider(
                        onLablePress: () {
                          labelList[index] = newLabel;
                          newLabel = 'بدون نام';
                          setState(() {});
                          Navigator.pop(context);
                        },
                        silderLable: labelList[index],
                        valueGiven: valueList[index],
                        color: colorList[index],
                        onchange: (value) {
                          setState(() {
                            valueList[index] = value;
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
          margin: EdgeInsets.symmetric(vertical: 1),
          decoration: BoxDecoration(
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(10),
              // bordernt(colors: [color, color.withOpacity(0.2)])),
              gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color.withOpacity(0.4)],
                begin: Alignment.bottomLeft,
              ),
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ]),
          child: TextButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: EditLable(
                      selectedLable: '$silderLable',
                      setStateFunction: onLablePress,
                    ),
                  ),
                ),
              );
            },
            child: Text(
              silderLable,
              style: GoogleFonts.harmattan(
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
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

// BoxDecoration(
// Radius: BorderRadius.circular(10),
// gradient:
// LinearGradie

class EditLable extends StatelessWidget {
  final selectedLable;
  final setStateFunction;
  const EditLable(
      {required this.selectedLable, required this.setStateFunction});

  @override
  Widget build(BuildContext context) {
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
              'تغیر لیبل "$selectedLable" به:',
              textDirection: TextDirection.rtl,
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
                newLabel = e;
                print(e);
              },
              textAlign: TextAlign.center,
              autofocus: true,
            ),
            FlatButton(
              color: Theme.of(context).colorScheme.secondary,
              onPressed: setStateFunction,
              child: Text(
                'تغییر بده',
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

//
class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double degToRad(double deg) => deg * (pi / 180.0);

    List paintList = [];
    List pathList = [];

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

    for (int index = 0; index < 8; index++) {
      final Paint paint1 = Paint()
        ..strokeWidth = 5.0
        ..color = colorList[index]
        ..strokeCap = StrokeCap.round;

      paintList.add(paint1);

      final pathObject = Path()
        ..moveTo(size.height / 2, size.width / 2)
        ..arcTo(
            Rect.fromCenter(
              center: Offset(size.height / 2, size.width / 2),
              height: size.height * valueList[index] / 10,
              width: size.width * valueList[index] / 10,
            ),
            degToRad(0 + (index * -45)),
            degToRad(-45),
            false);

      pathList.add(pathObject);

      canvas.drawPath(pathList[index], paintList[index]);

      arcLable(valueList[index], 0 + (index * -45), labelList[index]);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }
}
