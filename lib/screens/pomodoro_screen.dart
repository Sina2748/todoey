import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/utils/constants.dart';
import 'dart:math';
import 'dart:async';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  static const countdownDuration = Duration(minutes: 25);
  Duration duration = Duration();
  Timer? timer;

  bool countDown = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reset();
  }

  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = countDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }

////////////////////////////////

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         backgroundColor: Colors.orange[50],
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: Text("Flutter StopWatch Timer Demo"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               buildTime(),
//               SizedBox(
//                 height: 80,
//               ),
//               buildButtons()
//             ],
//           ),
//         ),
//       );
//
//   Widget buildTime() {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final hours = twoDigits(duration.inHours);
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//       buildTimeCard(time: hours, header: 'HOURS'),
//       SizedBox(
//         width: 8,
//       ),
//       buildTimeCard(time: minutes, header: 'MINUTES'),
//       SizedBox(
//         width: 8,
//       ),
//       buildTimeCard(time: seconds, header: 'SECONDS'),
//     ]);
//   }
//
//   Widget buildTimeCard({required String time, required String header}) =>
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//                 color: Colors.white, borderRadius: BorderRadius.circular(20)),
//             child: Text(
//               time,
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontSize: 50),
//             ),
//           ),
//           SizedBox(
//             height: 24,
//           ),
//           Text(header, style: TextStyle(color: Colors.black45)),
//         ],
//       );
//
//   Widget buildButtons() {
//     final isRunning = timer == null ? false : timer!.isActive;
//     final isCompleted = duration.inSeconds == 0;
//     return isRunning || isCompleted
//         ? Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ButtonWidget(
//                   text: 'STOP',
//                   onClicked: () {
//                     if (isRunning) {
//                       stopTimer(resets: false);
//                     }
//                   }),
//               SizedBox(
//                 width: 12,
//               ),
//               ButtonWidget(text: "CANCEL", onClicked: stopTimer),
//             ],
//           )
//         : ButtonWidget(
//             text: "Start Timer!",
//             color: Colors.black,
//             backgroundColor: Colors.white,
//             onClicked: () {
//               startTimer();
//             });
//   }
// }
//
// class ButtonWidget extends StatelessWidget {
//   final String text;
//   final Color color;
//   final Color backgroundColor;
//   final VoidCallback onClicked;
//
//   const ButtonWidget(
//       {Key? key,
//       required this.text,
//       required this.onClicked,
//       this.color = Colors.white,
//       this.backgroundColor = Colors.black})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) => ElevatedButton(
//       style: ElevatedButton.styleFrom(
//           primary: backgroundColor,
//           padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
//       onPressed: onClicked,
//       child: Text(
//         text,
//         style: TextStyle(fontSize: 20, color: color),
//       ));
// }

//////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;
// return isRunning || isCompleted
    print('isRunning: $isRunning');
    return Scaffold(
      // appBar: GradiantAppBar(pageTitle: 'پومودورو'),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: kBackgroundImage,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(12),
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
                        '$minutes:$seconds',
                        style: const TextStyle(
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
                        gradient: const RadialGradient(
                          center: Alignment(0.05, -0.08),
                          colors: [Colors.white, Color(0xfff8f8f8)],
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
                        ],
                      ),
                    ),
                    //
                    isRunning || isCompleted
                        ? TextButton(
                            onPressed: () {
                              print('1');
                              if (isRunning) {
                                stopTimer(resets: false);
                              }
                            },
                            child: Icon(
                              Icons.pause,
                              size: 50,
                              color: Colors.teal[700],
                            ),
                          )
                        : TextButton(
                            onPressed: () {
                              print('2');
                              startTimer();
                            },
                            child: Icon(
                              Icons.play_arrow,
                              size: 50,
                              color: Colors.teal[700],
                            ),
                          ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Column(
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
                                Icons.work,
                                color: Colors.teal[700],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '25 min',
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueGrey),
                        )
                      ],
                    ),
                    Column(
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
                                Icons.emoji_food_beverage,
                                color: Colors.teal[700],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '5 min',
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueGrey),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
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
