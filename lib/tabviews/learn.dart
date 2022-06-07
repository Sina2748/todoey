import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class TabBarLearn extends StatefulWidget {
  const TabBarLearn({
    Key? key,
  }) : super(key: key);

  @override
  State<TabBarLearn> createState() => _TabBarLearnState();
}

class _TabBarLearnState extends State<TabBarLearn> {
  String heroImgUrl = 'assets/images/hero/hero.png';
  String heroImgBlurUrl = 'assets/images/hero/hero-shadow.png';

  String imgUrl = 'assets/images/af.jpg';
  String imgBlurUrl = 'assets/images/blur af.png';
  double initX = 0.0, initY = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBackgroundImage,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 500,
                // color: Colors.red,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      // width: 400,
                      height: 500,
                      // child: null,
                    ),
                    StreamBuilder<GyroscopeEvent>(
                        stream: SensorsPlatform.instance.gyroscopeEvents,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.y.abs() > 0.0)
                              initX = initX + (snapshot.data!.y);
                            if (snapshot.data!.x.abs() > 0.0)
                              initY = initY + (snapshot.data!.x);
                          }
                          return Positioned(
                            left: 0 - initX * 0,
                            right: 0 + initX * 0,
                            top: 0 - initY * 1.9,
                            bottom: 0 + initY * 1.9,
                            child: Center(
                              child: Container(
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Container(
                                        // width: 380,
                                        // height: 200,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 0),
                                          image: DecorationImage(
                                            opacity: 0.9,
                                            colorFilter: ColorFilter.mode(
                                                Colors.white.withOpacity(.2),
                                                BlendMode.srcOver),
                                            image: AssetImage(heroImgBlurUrl),
                                            fit: BoxFit.fitWidth,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    Positioned(
                      // left: 20,
                      // right: 20,
                      // top: 10,
                      // bottom: 10,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/pomodoroteachingscreen');
                          },
                          child: Container(
                            // width: 400,
                            // height: 200,
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.white, width: 2),
                              image: DecorationImage(
                                image: AssetImage(heroImgUrl),
                                fit: BoxFit.fitWidth,
                                isAntiAlias: true,
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 230,
                width: 350,
                // color: Colors.red,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 400,
                      height: 200,
                      child: null,
                    ),
                    StreamBuilder<GyroscopeEvent>(
                        stream: SensorsPlatform.instance.gyroscopeEvents,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.y.abs() > 0.0)
                              initX = initX + (snapshot.data!.y);
                            if (snapshot.data!.x.abs() > 0.0)
                              initY = initY + (snapshot.data!.x);
                          }
                          return Positioned(
                            left: 0 - initX * 1.9,
                            right: 0 + initX * 1.9,
                            top: 0 - initY * 1.9,
                            bottom: 0 + initY * 1.9,
                            child: Center(
                              child: Container(
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Container(
                                        width: 380,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 0),
                                          image: DecorationImage(
                                            opacity: 0.9,
                                            colorFilter: ColorFilter.mode(
                                                Colors.white.withOpacity(.2),
                                                BlendMode.srcOver),
                                            image: AssetImage(imgBlurUrl),
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    Positioned(
                      // left: 20,
                      // right: 20,
                      // top: 10,
                      // bottom: 10,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/pomodoroteachingscreen');
                          },
                          child: Container(
                            width: 400,
                            height: 200,
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.white, width: 2),
                              image: DecorationImage(
                                image: AssetImage(imgUrl),
                                fit: BoxFit.fill,
                                isAntiAlias: true,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 230,
                width: 300,
                // color: Colors.red,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 400,
                      height: 200,
                      child: null,
                    ),
                    StreamBuilder<GyroscopeEvent>(
                        stream: SensorsPlatform.instance.gyroscopeEvents,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.y.abs() > 0.0)
                              initX = initX + (snapshot.data!.y);
                            if (snapshot.data!.x.abs() > 0.0)
                              initY = initY + (snapshot.data!.x);
                          }
                          return Positioned(
                            left: 0 - initX * 1.9,
                            right: 0 + initX * 1.9,
                            top: 0 - initY * 1.9,
                            bottom: 0 + initY * 1.9,
                            child: Center(
                              child: Container(
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Container(
                                        width: 380,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 0),
                                          image: DecorationImage(
                                            opacity: 0.9,
                                            colorFilter: ColorFilter.mode(
                                                Colors.white.withOpacity(.2),
                                                BlendMode.srcOver),
                                            image: AssetImage(imgBlurUrl),
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    Positioned(
                      // left: 20,
                      // right: 20,
                      // top: 10,
                      // bottom: 10,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/pomodoroteachingscreen');
                          },
                          child: Container(
                            width: 400,
                            height: 200,
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.white, width: 2),
                              image: DecorationImage(
                                image: AssetImage(imgUrl),
                                fit: BoxFit.fill,
                                isAntiAlias: true,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
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

// class TabBarLearn extends StatelessWidget {
//   const TabBarLearn({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: kBackgroundImage,
//       child: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
//         child: Column(
//           // crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: const [
//             LearnButton(
//               iconShape: Icons.list_sharp,
//               navigation: '/pomodoroteachingscreen',
//               backgroundPicture: 'assets/images/af.jpg',
//               title: 'لیست کارها',
//               locationPadding: EdgeInsets.only(
//                 top: 130,
//                 bottom: 20,
//                 left: 5,
//                 right: 20,
//               ),
//             ),
//             LearnButton(
//               iconShape: Icons.run_circle_outlined,
//               navigation: '/pomodoroteachingscreen',
//               backgroundPicture: 'assets/images/ac.jpg',
//               title: 'چرخه زندگی',
//               locationPadding: EdgeInsets.only(
//                 top: 130,
//                 bottom: 20,
//                 left: 5,
//                 right: 20,
//               ),
//             ),
//             LearnButton(
//               iconShape: Icons.timer,
//               navigation: '/pomodoroteachingscreen',
//               backgroundPicture: 'assets/images/ad.jpg',
//               title: 'پومودورو',
//               locationPadding: EdgeInsets.only(
//                 top: 130,
//                 bottom: 20,
//                 left: 5,
//                 right: 20,
//               ),
//             ),
//             LearnButton(
//               iconShape: Icons.swap_vertical_circle_sharp,
//               navigation: '/pomodoroteachingscreen',
//               backgroundPicture: 'assets/images/ag.jpg',
//               title: 'پومودرو',
//               locationPadding: EdgeInsets.only(
//                 top: 130,
//                 bottom: 20,
//                 left: 5,
//                 right: 20,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class LearnButton extends StatelessWidget {
//   final String navigation;
//   final String backgroundPicture;
//   final String title;
//   final dynamic locationPadding;
//   final IconData iconShape;
//
//   const LearnButton(
//       {Key? key,
//       required this.iconShape,
//       required this.navigation,
//       required this.backgroundPicture,
//       required this.title,
//       required this.locationPadding})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 3),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         // color: Colors.teal,
//         image: DecorationImage(
//           image: AssetImage(
//             backgroundPicture,
//           ),
//           fit: BoxFit.cover,
//           alignment: Alignment(0.3, 0),
//         ),
//       ),
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.pushNamed(context, navigation);
//         },
//         style: ButtonStyle(
//           elevation: MaterialStateProperty.all(0),
//           backgroundColor: MaterialStateProperty.all(
//             Color(0x006FE2D0),
//           ),
//           shape: MaterialStateProperty.all(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//         ),
//         child: Container(
//             child: Column(
//               children: [
//                 Icon(
//                   iconShape,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//                 Text(
//                   title,
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.lemonada(
//                     color: Colors.white,
//                     textStyle: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       letterSpacing: 3,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             alignment: Alignment.bottomRight,
//             width: double.infinity,
//             padding: locationPadding),
//       ),
//     );
//   }
// }
