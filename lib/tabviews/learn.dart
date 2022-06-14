import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
  String b4ImgUrl = 'assets/images/hero/B5.png';
  String b4ImgBlurUrl = 'assets/images/hero/B5S.png';

  double initX = 0.0, initY = 0.0;
  var top;
  var bottom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBackgroundImage,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: StreamBuilder<GyroscopeEvent>(
              stream: SensorsPlatform.instance.gyroscopeEvents,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.y.abs() > 0.0)
                    initX = initX + (snapshot.data!.y);
                  if (snapshot.data!.x.abs() > 0.0)
                    initY = initY + (snapshot.data!.x);
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    headerFooterImage(
                      height: 500,
                      WidgetOnTop: Positioned(
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
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      initX: initX,
                      initY: initY,
                      picblur: heroImgBlurUrl,
                      pic: heroImgUrl,
                    ),
                    //thubnails
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // color: Colors.redAccent,
                            child: imageStack(
                                line1: 'To Do List',
                                line2: 'عادت سازی برای انجام',
                                line3: 'کارها',
                                width: 175,
                                height: 270,
                                initX: initX,
                                initY: initY,
                                bImgBlurUrl: b1ImgBlurUrl,
                                bImgUrl: b1ImgUrl),
                          ),
                          Container(
                            // color: Colors.green,
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  // color: Colors.red,
                                  child: Text(
                                    'آموزش‌ها:      ',
                                    textDirection: TextDirection.rtl,
                                    // textAlign: TextAlign.center,
                                    style: GoogleFonts.lemonada(
                                        textStyle: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ),
                                ),
                                imageStack(
                                    line1: 'پومودرو',
                                    line2: 'روش مدیریت زمان',
                                    width: 175,
                                    height: 200,
                                    initX: initX,
                                    initY: initY,
                                    bImgBlurUrl: b2ImgBlurUrl,
                                    bImgUrl: b2ImgUrl),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),

                      // color: Colors.red,
                      child: imageStack(
                          line1: "چرخه زندگی",
                          line2: "هر هدف چقدر مهم هست؟",
                          line3: "در یک نگاه تعادلش رو بررسی کن",
                          width: 350,
                          height: 175,
                          initX: initX,
                          initY: initY,
                          bImgBlurUrl: b3ImgBlurUrl,
                          bImgUrl: b3ImgUrl),
                    ),
                    //Ending
                    headerFooterImage(
                      height: 400,
                      WidgetOnTop: Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  'از اینترنت چه خبر؟',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lemonada(
                                      textStyle: TextStyle(
                                    fontSize: 25,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w600,
                                  )),
                                ),
                              ),
                              NewsLink(
                                newsTitle:
                                    '۱۱ راهکار برای افزایش تمرکز موقع کار',
                                imageLink:
                                    'https://cafetarget.com/wp-content/uploads/2020/09/steve-johnson-F3ig12CrnGo-unsplash-scaled.jpg',
                                newsLink:
                                    'https://cafetarget.com/2020/11/09/focus/',
                              ),
                              NewsLink(
                                newsTitle:
                                    '۳ دلیل عدم کارکد درست دفتر برنامه‌ریزی شخصی',
                                imageLink:
                                    'https://my-bujo.ir/wp-content/uploads/2021/12/3-%D8%AF%D9%84%DB%8C%D9%84-%D8%B9%D8%AF%D9%85-%DA%A9%D8%A7%D8%B1%DA%A9%D8%B1%D8%AF-%D8%AF%D8%B1%D8%B3%D8%AA-%D8%AF%D9%81%D8%AA%D8%B1-%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D9%87%E2%80%8C%D8%B1%DB%8C%D8%B2%DB%8C-%D8%B4%D8%AE%D8%B5%DB%8C.jpg',
                                newsLink:
                                    'https://my-bujo.ir/3-%d8%af%d9%84%db%8c%d9%84-%d8%b9%d8%af%d9%85-%da%a9%d8%a7%d8%b1%da%a9%d8%b1%d8%af-%d8%af%d8%b1%d8%b3%d8%aa-%d8%af%d9%81%d8%aa%d8%b1-%d8%a8%d8%b1%d9%86%d8%a7%d9%85%d9%87%e2%80%8c%d8%b1%db%8c%d8%b2/',
                              ),
                              NewsLink(
                                newsTitle: 'ماه نگار',
                                imageLink:
                                    'https://cafetarget.com/wp-content/uploads/2020/09/photo_2020-08-24_15-11-21.jpg',
                                newsLink:
                                    'https://cafetarget.com/2020/09/07/monthly-log/',
                              ),
                              NewsLink(
                                newsTitle:
                                    'عادت نگاری و نقش اساسی آن در بولت ژورنال',
                                imageLink:
                                    'https://my-bujo.ir/wp-content/uploads/2020/05/%D8%B9%D8%A7%D8%AF%D8%AA-%D9%86%DA%AF%D8%A7%D8%B1%DB%8C-%D9%88-%D9%86%D9%82%D8%B4-%D8%A2%D9%86-%D8%AF%D8%B1-%D8%A8%D9%88%D9%84%D8%AA-%DA%98%D9%88%D8%B1%D9%86%D8%A7%D9%84-%D8%A2%D9%85%D9%88%D8%B2%D8%B4-%D8%A7%D8%B3%D8%AA%D9%81%D8%A7%D8%AF%D9%87.jpg',
                                newsLink:
                                    'https://my-bujo.ir/%D8%B9%D8%A7%D8%AF%D8%AA-%D9%86%DA%AF%D8%A7%D8%B1%DB%8C-%D9%88-%D9%86%D9%82%D8%B4-%D8%A7%D8%B3%D8%A7%D8%B3%DB%8C-%D8%A2%D9%86-%D8%AF%D8%B1-%D8%A8%D9%88%D9%84%D8%AA-%DA%98%D9%88%D8%B1%D9%86%D8%A7%D9%84/',
                              ),
                            ],
                          ),
                        ),
                      ),
                      initX: initX,
                      initY: initY,
                      picblur: b4ImgBlurUrl,
                      pic: b4ImgUrl,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class NewsLink extends StatelessWidget {
  const NewsLink({
    required this.imageLink,
    required this.newsLink,
    required this.newsTitle,
    Key? key,
  }) : super(key: key);
  final String newsLink;
  final String imageLink;
  final String newsTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: () async {
          if (!await launchUrl(Uri.parse(newsLink)))
            throw 'Could not launch _url';
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white12,
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.centerRight,
              // color: Colors.white24,
              height: 80,
              width: 235,
              child: Text(
                newsTitle,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.start,
                style: GoogleFonts.harmattan(
                    textStyle: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageLink),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
                // color: Colors.white,
              ),
              // color: Colors.red.withOpacity(0.3),
              height: 80,
              width: 100,
              // child: Image.network(
              //   imageLink,
              //   fit: BoxFit.cover,
              // ),
            )
          ],
        ),
      ),
    );
  }
}

class headerFooterImage extends StatelessWidget {
  const headerFooterImage({
    Key? key,
    required this.initX,
    required this.initY,
    required this.picblur,
    required this.pic,
    required this.WidgetOnTop,
    required this.height,
  }) : super(key: key);

  final double initX;
  final double initY;
  final String picblur;
  final String pic;
  final dynamic WidgetOnTop;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      // color: Colors.red,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0 - initX * 1.9 < 10.0 && 0 - initX * 1.9 > -10.0
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
                          border: Border.all(color: Colors.white, width: 0),
                          image: DecorationImage(
                            opacity: 0.8,
                            colorFilter: ColorFilter.mode(
                                Colors.white.withOpacity(.2),
                                BlendMode.srcOver),
                            image: AssetImage(picblur),
                            fit: BoxFit.fitWidth,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            // left: 20,
            // right: 20,
            // top: 10,
            // bottom: 10,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/pomodoroteachingscreen');
                },
                child: Container(
                  // width: 400,
                  // height: 200,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                      image: AssetImage(pic),
                      fit: BoxFit.fitWidth,
                      isAntiAlias: true,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
          ),
          WidgetOnTop,
        ],
      ),
    );
  }
}

class imageStack extends StatelessWidget {
  const imageStack({
    Key? key,
    required this.width,
    required this.height,
    required this.initX,
    required this.initY,
    required this.bImgBlurUrl,
    required this.bImgUrl,
    required this.line1,
    required this.line2,
    this.line3 = "",
  }) : super(key: key);
  final double width;
  final double height;
  final double initX;
  final double initY;
  final String bImgBlurUrl;
  final String bImgUrl;
  final String line1;
  final String line2;
  final String line3;

  final double lim = 10.0;
  final double a = 1.9;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: height + 0,
          width: width + 0,
          child: null,
        ),
        Positioned(
          left: 0 - initX * a <= lim && 0 - initX * a >= -lim
              ? 0 - initX * a
              : 0 - initX * a > lim
                  ? lim
                  : -lim,
          right: 0 + initX * a < -lim
              ? -lim
              : 0 + initX * a > lim
                  ? lim
                  : 0 + initX * a,
          top: 0 - initY * a > lim
              ? lim
              : 0 - initY * a < -lim
                  ? -lim
                  : 0 - initY * a,
          bottom: 0 + initY * a < -lim
              ? -lim
              : -0 + initY * a > lim
                  ? lim
                  : -0 + initY * a,
          child: Container(
            child: Container(
              width: width - 10,
              height: height - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  opacity: 0.7,
                  image: AssetImage(bImgBlurUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 00,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/pomodoroteachingscreen');
            },
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.white, width: 2),
                image: DecorationImage(
                  image: AssetImage(bImgUrl),
                  fit: BoxFit.fill,
                  // isAntiAlias: true,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          right: 20,
          child: Container(
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$line1',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.end,
                  style: GoogleFonts.lemonada(
                      textStyle: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  )),
                ),
                Text(
                  '$line2',
                  textDirection: TextDirection.rtl,
                  // textAlign: TextAlign.center,
                  style: GoogleFonts.lemonada(
                      textStyle: TextStyle(
                    fontSize: 10,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  )),
                ),
                Text(
                  '$line3',
                  textDirection: TextDirection.rtl,
                  // textAlign: TextAlign.center,
                  style: GoogleFonts.lemonada(
                      textStyle: TextStyle(
                    fontSize: 10,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  )),
                ),
              ],
            ),
          ),
        )
      ],
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
