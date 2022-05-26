import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todoey/utils/constants.dart';
import 'dart:math';
import 'dart:async';
import 'package:todoey/widgets/soundplayer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pomodoro_bottom_sheet.dart';
import 'dart:math';
import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:todoey/notification_service.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:shared_preferences/shared_preferences.dart';

int startedTime = 0;

var ppp;

double raidus = 30;
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
  Color iconButtonactiveColorB = Colors.grey.withOpacity(0.9);
  Color iconactiveColorB = Colors.grey.shade600;
  List<Color> colorList = [Colors.white, Color(0xffecfcfa)];
  Color iconButtonactiveColor = Colors.teal;
  Color iconactiveColor = Colors.teal[700]!;

  // var countdownDuration = Duration(minutes: timerNumber);
  var countdownDuration;
  Duration duration = Duration();
  Timer? timer;

  bool countDown = true;
  bool working = true;

  void selectBreak() {
    iconactiveColor = Colors.grey.shade600;
    iconButtonactiveColor = Colors.grey.withOpacity(0.9);
    colorList = [Colors.white, Color(0xfff1f1f1)];
    colorListB = [Colors.white, Color(0xffecfcfa)];
    iconButtonactiveColorB = Colors.teal.shade700;
    iconactiveColorB = Colors.teal[700]!;
  }

  void selectWork() {
    iconactiveColorB = Colors.grey.shade600;
    print('icon pressed WITH FUNCTION');
    iconButtonactiveColorB = Colors.grey.withOpacity(0.9);
    colorListB = [Colors.white, Color(0xfff1f1f1)];
    colorList = [Colors.white, Color(0xffecfcfa)];
    iconButtonactiveColor = Colors.teal.shade700;
    iconactiveColor = Colors.teal[700]!;
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
    //
    tz.initializeTimeZones();

    reset();
  }

  void reset() {
    ppp = 359.9;
    countdownDuration = Duration(minutes: timerNumber);
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void startTimer() {
    startedTime = tz.TZDateTime.now(tz.local).second;
    final prefs = await SharedPreferences.getInstance();

    notificationPromodoroEnds(countdownDuration.inSeconds);
    playSoundHere();
    timer?.cancel();
    timer = Timer.periodic(Duration(milliseconds: 1000), (_) => addTime());
  }

  void addTime() {
    // animations
    setState(() {
      if (reamLight == Colors.teal.withOpacity(0.2)) {
        raidus = 60;
        reamLight = Colors.red.withOpacity(0.2);
      } else {
        raidus = 30;
        reamLight = Colors.teal.withOpacity(0.2);
      }
      // time
      final seconds = (Duration(minutes: timerNumber).inSeconds) -
          (tz.TZDateTime.now(tz.local).second - startedTime);

      if (seconds < 0) {
        timer?.cancel();
        controller.reverse();
        reamLight = Colors.grey.withOpacity(0.1);
        playSoundHere();
        working ? working = false : working = true;
        toggleTimerNumber();
      } else {
        duration = Duration(seconds: seconds);
        ppp = duration.inSeconds * 6 / timerNumber;
      }
    });
  }

  void stopTimer({bool resets = true}) {
    playSoundHere();
    stopNotificationPromodoroEnds(1);
    reamLight = Colors.grey.withOpacity(0.1);
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  void playSoundHere() async {
    for (int i = 1; i < 3; i++) {
      playSound(i);
      await Future.delayed(Duration(milliseconds: 200 + (i * 70)));
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
        alignment: Alignment.center,
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
                      height: 390,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.fastOutSlowIn,
                        width: 300 + raidus,
                        height: 300 + raidus,
                        decoration: BoxDecoration(
                            // color: Colors.red.withOpacity(0.2),
                            gradient: RadialGradient(
                              stops: [0.9, 1],
                              colors: [
                                reamLight,
                                Colors.white.withOpacity(0.2)
                              ],
                              // begin: Alignment(0, 0),
                            ),
                            shape: BoxShape.circle),
                      ),
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
                        painter:
                            ClockPainter(ppp, Colors.grey.withOpacity(0.2)),
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
                              stopTimer(resets: true);
                              controller.reverse();
                            }
                          },
                        ),
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
                                    offset: const Offset(0, 2),
                                  ),
                                ]),
                            child: IconButton(
                              icon: Icon(Icons.work),
                              onPressed: () {
                                working = true;
                                toggleTimerNumber();
                              },
                              color: iconactiveColor,
                            ),
                          ),
                        ],
                      ),
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
                                    offset: Offset(0, 1),
                                  ),
                                ]),
                            child: IconButton(
                              icon: Icon(Icons.emoji_food_beverage),
                              onPressed: () {
                                working = false;
                                toggleTimerNumber();
                              },
                              color: iconactiveColorB,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
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
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  colors: [Colors.white, Color(0xfff1f1f1)],
                                  stops: [0.1, 0.9],
                                ),
                                shape: BoxShape.rectangle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.9),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: Offset(0, 1),
                                  ),
                                ]),
                            child: IconButton(
                              icon: Icon(Icons.settings),
                              color: Colors.grey.shade600,
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) => SingleChildScrollView(
                                    child: BottomSheetUp(
                                      workCallBack: (value) {
                                        setState(() {
                                          workTimer = value;
                                          toggleTimerNumber();
                                          print(workTimer);
                                        });
                                      },
                                      selectedTime: breakTimer.toString(),
                                      breakCallBack: (value) {
                                        setState(() {
                                          breakTimer = value;
                                          toggleTimerNumber();
                                          print(breakTimer);
                                        });
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
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
    // Color _color = Colors.tealAccent.withOpacity(0.2);
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
      ],
    );
  }
}

//---- Painting the Clock
class ClockPainter extends CustomPainter {
  ClockPainter(this.sweepAngle, this.color);
  final double? sweepAngle;
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12.0 // 1.
      ..style = PaintingStyle.stroke // 2.
      ..color = color!; // 3.

    double degToRad(double deg) => deg * (pi / 180.0);

    final path = Path()
      ..arcTo(
          // 4.
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height - 30,
            width: size.width - 30,
          ), // 5.
          degToRad(-90), // 6.
          degToRad(sweepAngle!), // 7.
          false);

    canvas.drawPath(path, paint); // 8.
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
