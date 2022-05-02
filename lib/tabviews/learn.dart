import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarLearn extends StatelessWidget {
  const TabBarLearn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBackgroundImage,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.teal,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/af.jpg",
                  ),
                  fit: BoxFit.cover,
                  // colorFilter:
                  //     ColorFilter.mode(Colors.indigo[100]!, BlendMode.softLight),
                ),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: null,
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.swap_vertical_circle_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        ' پومودورو چیست؟',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lemonada(
                          color: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  alignment: Alignment.bottomRight,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 100,
                    bottom: 50,
                    left: 5,
                    right: 20,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.teal,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/ac.jpg",
                  ),
                  fit: BoxFit.cover,
                  // colorFilter:
                  //     ColorFilter.mode(Colors.indigo[100]!, BlendMode.softLight),
                ),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: null,
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.pie_chart_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        'چرخه تعادل زندگی',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lemonada(
                          color: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  alignment: Alignment.bottomRight,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 100,
                    bottom: 50,
                    left: 5,
                    right: 20,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.teal,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/ag.jpg",
                  ),
                  fit: BoxFit.cover,
                  // colorFilter:
                  //     ColorFilter.mode(Colors.indigo[100]!, BlendMode.softLight),
                ),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: null,
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.event_note,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        'بولت ژورنال',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lemonada(
                          color: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  alignment: Alignment.bottomRight,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 100,
                    bottom: 50,
                    left: 5,
                    right: 20,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.teal,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/ad.jpg",
                  ),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.indigo[100]!, BlendMode.softLight),
                ),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: null,
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.qr_code_scanner,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        'ایکیگای چیست؟',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lemonada(
                          color: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  alignment: Alignment.bottomRight,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 40,
                    bottom: 20,
                    left: 5,
                    right: 20,
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
