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

class _PomodoroScreenState extends State<PomodoroScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  static const countdownDuration = Duration(minutes: 25);
  Duration duration = Duration();
  Timer? timer;

  bool countDown = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 450),
    );
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
    print('addSeconds: $addSeconds');
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      print('seconds: $seconds');
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

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;
// return isRunning || isCompleted

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
                isRunning || isCompleted
                    ? StopWatchButton(
                        buttonIcon: GestureDetector(
                          child: Center(
                            child: AnimatedIcon(
                              size: 50,
                              color: Colors.green,
                              icon: AnimatedIcons.play_pause,
                              progress: controller,
                              semanticLabel: 'Start the timer',
                            ),
                          ),
                          onTap: () {
                            print('stopped');
                            print('isRunning: $isRunning');
                            print('isCompleted: $isCompleted');

                            if (isRunning) {
                              stopTimer(resets: false);
                              controller.reverse();
                            }
                          },
                        ),

                        // TextButton(
                        //   onPressed: () async {
                        //     print('1');
                        //     print('isRunning: $isRunning');
                        //     print('isCompleted: $isCompleted');
                        //
                        //     if (isRunning) {
                        //       stopTimer(resets: false);
                        //     }
                        //   },
                        //   child: Icon(
                        //     Icons.pause,
                        //     size: 50,
                        //     color: Colors.teal[700],
                        //   ),
                        // ),
                      )
                    : StopWatchButton(
                        buttonIcon: GestureDetector(
                          child: Center(
                            child: AnimatedIcon(
                              size: 50,
                              color: Colors.green,
                              icon: AnimatedIcons.play_pause,
                              progress: controller,
                              semanticLabel: 'Start the timer',
                            ),
                          ),
                          onTap: () {
                            controller.forward();
                            print('started');
                            startTimer();
                          },
                        ),
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

class StopWatchButton extends StatelessWidget {
  final buttonIcon;
  const StopWatchButton({Key? key, required this.buttonIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          child: buttonIcon,
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

        // TextButton(
        //      onPressed: () async {
        //        print('2');
        //        print('isRunning: $isRunning');
        //        print('isCompleted: $isCompleted');
        //
        //        startTimer();
        //        await Future.delayed(Duration(seconds: 5));
        //      },
        //      child: Icon(
        //        Icons.play_arrow,
        //        size: 50,
        //        color: Colors.teal[700],
        //      ),
        //    ),
      ],
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
