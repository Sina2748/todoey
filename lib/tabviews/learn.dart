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

  String b1ImgUrl = 'assets/images/hero/B1.png';
  String b1ImgBlurUrl = 'assets/images/hero/B1S.png';
  String b2ImgUrl = 'assets/images/hero/B2.png';
  String b2ImgBlurUrl = 'assets/images/hero/B2S.png';
  String b3ImgUrl = 'assets/images/hero/B3.png';
  String b3ImgBlurUrl = 'assets/images/hero/B3S.png';

  double initX = 0.0, initY = 0.0;
  double lim = 10.0;
  var top;
  var bottom;

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
                    StreamBuilder<GyroscopeEvent>(
                        stream: SensorsPlatform.instance.gyroscopeEvents,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.y.abs() > 0.0)
                              initX = initX + (snapshot.data!.y);

                            if (snapshot.data!.x.abs() > 0.0)
                              initY = initY + (snapshot.data!.x);
                            top = 20 - initY * 1.9 > 30.0
                                ? 30.0
                                : 20 - initY * 1.9;
                            bottom = -20 + initY * 1.9 < -30
                                ? -30.0
                                : -20 + initY * 1.9;
                            print(bottom);
                            print(top);
                          }
                          return Positioned(
                            left: 0 - initX * 1.9 < 10.0 &&
                                    0 - initX * 1.9 > -10.0
                                ? 0 - initX * 1.9
                                : 0 - initX * 1.9 > 10.0
                                    ? 10.0
                                    : -10,
                            right: -0 + initX * 1.9 < -10.0
                                ? -10.0
                                : 0 + initX * 1.9 > 10.0
                                    ? 10.0
                                    : 0 + initX * 1.9,
                            top: 20 - initY * 1.9 > 30.0
                                ? 30.0
                                : 20 - initY * 1.9 < -30.0
                                    ? -30.0
                                    : 20 - initY * 1.9,
                            bottom: -20 + initY * 1.9 < -30
                                ? -30.0
                                : -20 + initY * 1.9 > 30
                                    ? 30
                                    : -20 + initY * 1.9,
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
                                            opacity: 0.8,
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
                    Positioned(
                      bottom: 100,
                      right: 20,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        height: 200,
                        width: 300,
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('go!'),
                            ),
                            Spacer(),
                            Text(
                              'تخفیف ويژه',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lemonada(
                                  textStyle: TextStyle(
                                fontSize: 25,
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 230,
                          width: 175,
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
                                left: 0 - initX * 1.9 < lim &&
                                        0 - initX * 1.9 > -lim
                                    ? 0 - initX * 1.9
                                    : 0 - initX * 1.9 > lim
                                        ? lim
                                        : -5,
                                right: -0 + initX * 1.9 < -lim
                                    ? -lim
                                    : 0 + initX * 1.9 > lim
                                        ? lim
                                        : 0 + initX * 1.9,
                                top: 0 - initY * 1.9 > lim
                                    ? lim
                                    : 0 - initY * 1.9 < -lim
                                        ? -lim
                                        : 0 - initY * 1.9,
                                bottom: -0 + initY * 1.9 < -lim
                                    ? -lim
                                    : -0 + initY * 1.9 > lim
                                        ? lim
                                        : -0 + initY * 1.9,
                                child: Center(
                                  child: Container(
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Container(
                                            width: 175,
                                            height: 230,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                opacity: 0.6,
                                                colorFilter: ColorFilter.mode(
                                                    Colors.white
                                                        .withOpacity(.2),
                                                    BlendMode.srcOver),
                                                image: AssetImage(b1ImgBlurUrl),
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
                          bottom: 00,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/pomodoroteachingscreen');
                              },
                              child: Container(
                                width: 175,
                                height: 230,
                                decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.white, width: 2),
                                  image: DecorationImage(
                                    image: AssetImage(b1ImgUrl),
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
                    Container(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 200,
                            width: 175,
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
                                  left: 0 - initX * 1.9 < lim &&
                                          0 - initX * 1.9 > -lim
                                      ? 0 - initX * 1.9
                                      : 0 - initX * 1.9 > lim
                                          ? lim
                                          : -5,
                                  right: -0 + initX * 1.9 < -lim
                                      ? -lim
                                      : 0 + initX * 1.9 > lim
                                          ? lim
                                          : 0 + initX * 1.9,
                                  top: 0 - initY * 1.9 > lim
                                      ? lim
                                      : 0 - initY * 1.9 < -lim
                                          ? -lim
                                          : 0 - initY * 1.9,
                                  bottom: -0 + initY * 1.9 < -lim
                                      ? -lim
                                      : -0 + initY * 1.9 > lim
                                          ? lim
                                          : -0 + initY * 1.9,
                                  child: Center(
                                    child: Container(
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Container(
                                              width: 175,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  opacity: 0.6,
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.white
                                                          .withOpacity(.2),
                                                      BlendMode.srcOver),
                                                  image:
                                                      AssetImage(b2ImgBlurUrl),
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
                            bottom: 00,
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/pomodoroteachingscreen');
                                },
                                child: Container(
                                  width: 175,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.white, width: 2),
                                    image: DecorationImage(
                                      image: AssetImage(b2ImgUrl),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),

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
                            left:
                                0 - initX * 1.9 < lim && 0 - initX * 1.9 > -lim
                                    ? 0 - initX * 1.9
                                    : 0 - initX * 1.9 > lim
                                        ? lim
                                        : -5,
                            right: -0 + initX * 1.9 < -lim
                                ? -lim
                                : 0 + initX * 1.9 > lim
                                    ? lim
                                    : 0 + initX * 1.9,
                            top: 0 - initY * 1.9 > lim
                                ? lim
                                : 0 - initY * 1.9 < -lim
                                    ? -lim
                                    : 0 - initY * 1.9,
                            bottom: -0 + initY * 1.9 < -lim
                                ? -lim
                                : -0 + initY * 1.9 > lim
                                    ? lim
                                    : -0 + initY * 1.9,
                            child: Center(
                              child: Container(
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Container(
                                        width: 400,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 0),
                                          image: DecorationImage(
                                            opacity: 0.9,
                                            colorFilter: ColorFilter.mode(
                                                Colors.white.withOpacity(.2),
                                                BlendMode.srcOver),
                                            image: AssetImage(b3ImgBlurUrl),
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
                                image: AssetImage(b3ImgUrl),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
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
                                left: 0 - initX * 1.9 < 10.0 &&
                                        0 - initX * 1.9 > -10.0
                                    ? 0 - initX * 1.9
                                    : 0 - initX * 1.9 > 10.0
                                        ? 10.0
                                        : -10,
                                right: -0 + initX * 1.9 < -10.0
                                    ? -10.0
                                    : 0 + initX * 1.9 > 10.0
                                        ? 10.0
                                        : 0 + initX * 1.9,
                                top: 20 - initY * 1.9 > 30.0
                                    ? 30.0
                                    : 20 - initY * 1.9 < -30.0
                                        ? -30.0
                                        : 20 - initY * 1.9,
                                bottom: -20 + initY * 1.9 < -30
                                    ? -30.0
                                    : -20 + initY * 1.9 > 30
                                        ? 30
                                        : -20 + initY * 1.9,
                                child: Center(
                                  child: Container(
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 0),
                                              image: DecorationImage(
                                                opacity: 0.9,
                                                colorFilter: ColorFilter.mode(
                                                    Colors.white
                                                        .withOpacity(.2),
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
                          bottom: 00,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/pomodoroteachingscreen');
                              },
                              child: Container(
                                width: 100,
                                height: 100,
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
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
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
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 0),
                                              image: DecorationImage(
                                                opacity: 0.9,
                                                colorFilter: ColorFilter.mode(
                                                    Colors.white
                                                        .withOpacity(.2),
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
                          bottom: 00,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/pomodoroteachingscreen');
                              },
                              child: Container(
                                width: 100,
                                height: 100,
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
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
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
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 0),
                                              image: DecorationImage(
                                                opacity: 0.9,
                                                colorFilter: ColorFilter.mode(
                                                    Colors.white
                                                        .withOpacity(.2),
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
                          bottom: 00,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/pomodoroteachingscreen');
                              },
                              child: Container(
                                width: 100,
                                height: 100,
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
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      child: Text(
                          'A material widget thats displayed at the bottom of an app for '),
                    ),
                    Container(
                      width: 100,
                      child: Text('selecting among a small number of views'),
                    ),
                    Container(
                      width: 100,
                      child: Text('typically between three and five for '),
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
