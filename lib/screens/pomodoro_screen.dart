import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/utils/constants.dart';
import 'dart:math';
import 'dart:async';
import 'package:todoey/widgets/soundplayer.dart';

var reamLight = Colors.grey.withOpacity(0.1);

int workTimer = 25;
int breakTimer = 5;
int timerNumber = workTimer;

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

  List<Color> colorListB = [Colors.white, Color(0xfff1f1f1)];
  Color iconButtonactiveColorB = Colors.grey.withOpacity(0.3);
  Color iconactiveColorB = Colors.teal[700]!;
  List<Color> colorList = [Colors.white, Colors.grey.withOpacity(0.3)];
  Color iconButtonactiveColor = Colors.teal.withOpacity(1);
  Color iconactiveColor = Colors.grey.shade300;

  // var countdownDuration = Duration(minutes: timerNumber);
  var countdownDuration;
  Duration duration = Duration();
  Timer? timer;

  bool countDown = true;
  bool working = true;

  void selectBreak() {
    iconactiveColor = Colors.teal[700]!;
    iconButtonactiveColor = Colors.grey.withOpacity(0.3);
    colorList = [Colors.white, Color(0xfff1f1f1)];
    colorListB = [Colors.white, iconButtonactiveColor];
    iconButtonactiveColorB = Colors.teal.withOpacity(1);
    iconactiveColorB = Colors.grey.shade300;
  }

  void selectWork() {
    iconactiveColorB = Colors.teal[700]!;
    print('icon pressed WITH FUNCTION');
    iconButtonactiveColorB = Colors.grey.withOpacity(0.3);
    colorListB = [Colors.white, Color(0xfff1f1f1)];
    colorList = [Colors.white, iconButtonactiveColor];
    iconButtonactiveColor = Colors.teal.withOpacity(1);
    iconactiveColor = Colors.grey.shade300;
  }

  void toggleTimerNumber() {
    setState(() {
      print('toggleTimerNumber');
      if (working) {
        selectWork();
        timerNumber = workTimer;
        reset();
      } else {
        selectBreak();
        timerNumber = breakTimer;
        reset();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    reset();
  }

  void reset() {
    countdownDuration = Duration(minutes: timerNumber);
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void startTimer() {
    playSoundHere();
    timer?.cancel();
    timer = Timer.periodic(Duration(milliseconds: 10), (_) => addTime());
  }

  void addTime() {
    final addSeconds = countDown ? -1 : 1;
    // print('addSeconds: $addSeconds');
    setState(() {
      if (reamLight == Colors.teal.withOpacity(0.2)) {
        reamLight = Colors.red.withOpacity(0.2);
      } else {
        reamLight = Colors.teal.withOpacity(0.2);
      }
      final seconds = duration.inSeconds + addSeconds;
      // print('seconds: $seconds');
      if (seconds < 0) {
        timer?.cancel();
        controller.reverse();
        reamLight = Colors.grey.withOpacity(0.1);
        playSoundHere();
        working ? working = false : working = true;
        toggleTimerNumber();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer({bool resets = true}) {
    playSoundHere();
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  void playSoundHere() async {
    for (int i = 1; i < 5; i++) {
      playSound(i);
      await Future.delayed(Duration(milliseconds: 400 + (i * 100)));
    }
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
                        colorReam: reamLight,
                        buttonIcon: GestureDetector(
                          child: Center(
                            child: AnimatedIcon(
                              size: 50,
                              color: Colors.teal,
                              icon: AnimatedIcons.play_pause,
                              progress: controller,
                              semanticLabel: 'Start the timer',
                            ),
                          ),
                          onTap: () {
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
                        colorReam: reamLight,
                        buttonIcon: GestureDetector(
                          child: Center(
                            child: AnimatedIcon(
                              size: 50,
                              color: Colors.teal,
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
                Container(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              //---- Shadow
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    shape: BoxShape.rectangle),
                              ),
                              AnimatedContainer(
                                curve: Curves.fastOutSlowIn,
                                duration: const Duration(seconds: 1),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      colors: colorList,
                                      stops: [0.1, 0.9],
                                    ),
                                    shape: BoxShape.rectangle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: iconButtonactiveColor,
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: Offset(-1, 3),
                                      ),
                                    ]),
                                child: IconButton(
                                  icon: Icon(Icons.work),
                                  onPressed: () {
                                    working = true;
                                    toggleTimerNumber();
                                    setState(() {
                                      iconactiveColor = Colors.grey.shade300;
                                      print('icon pressed');
                                      iconButtonactiveColor =
                                          Colors.teal.withOpacity(1);
                                      colorList = [
                                        Colors.white,
                                        iconButtonactiveColor
                                      ];
                                      colorListB = [
                                        Colors.white,
                                        Color(0xfff1f1f1)
                                      ];
                                      iconButtonactiveColorB =
                                          Colors.grey.withOpacity(0.3);
                                      iconactiveColorB = Colors.teal[700]!;
                                    });
                                  },
                                  color: iconactiveColor,
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
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    shape: BoxShape.rectangle),
                              ),
                              AnimatedContainer(
                                curve: Curves.fastOutSlowIn,
                                duration: const Duration(seconds: 1),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      colors: colorListB,
                                      stops: [0.1, 0.9],
                                    ),
                                    shape: BoxShape.rectangle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: iconButtonactiveColorB,
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: Offset(-1, 3),
                                      ),
                                    ]),
                                child: IconButton(
                                  icon: Icon(Icons.emoji_food_beverage),
                                  onPressed: () {
                                    working = false;
                                    toggleTimerNumber();
                                    setState(() {
                                      iconactiveColor = Colors.teal[700]!;
                                      print('icon pressed');
                                      iconButtonactiveColor =
                                          Colors.grey.withOpacity(0.3);
                                      colorList = [
                                        Colors.white,
                                        Color(0xfff1f1f1)
                                      ];
                                      colorListB = [
                                        Colors.white,
                                        iconButtonactiveColor
                                      ];
                                      iconButtonactiveColorB =
                                          Colors.teal.withOpacity(1);
                                      iconactiveColorB = Colors.grey.shade300;
                                    });
                                  },
                                  color: iconactiveColorB,
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
                  ),
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
  final Color colorReam;
  const StopWatchButton(
      {Key? key, required this.buttonIcon, required this.colorReam})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _color = Colors.tealAccent.withOpacity(0.2);
    return Stack(
      alignment: Alignment.center,
      children: [
        //---- Shadow
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: 100,
          height: 100,
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
              // color: Colors.tealAccent.withOpacity(0.2),
              color: colorReam,
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
