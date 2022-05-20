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
          children: const [
            LearnButton(
              iconShape: Icons.list_sharp,
              navigation: '/pomodoroteachingscreen',
              backgroundPicture: 'assets/images/af.jpg',
              title: 'لیست کارها',
              locationPadding: EdgeInsets.only(
                top: 130,
                bottom: 20,
                left: 5,
                right: 20,
              ),
            ),
            LearnButton(
              iconShape: Icons.run_circle_outlined,
              navigation: '/pomodoroteachingscreen',
              backgroundPicture: 'assets/images/ac.jpg',
              title: 'چرخه زندگی',
              locationPadding: EdgeInsets.only(
                top: 130,
                bottom: 20,
                left: 5,
                right: 20,
              ),
            ),
            LearnButton(
              iconShape: Icons.timer,
              navigation: '/pomodoroteachingscreen',
              backgroundPicture: 'assets/images/ad.jpg',
              title: 'پومودورو',
              locationPadding: EdgeInsets.only(
                top: 130,
                bottom: 20,
                left: 5,
                right: 20,
              ),
            ),
            LearnButton(
              iconShape: Icons.swap_vertical_circle_sharp,
              navigation: '/pomodoroteachingscreen',
              backgroundPicture: 'assets/images/ag.jpg',
              title: 'پومودرو',
              locationPadding: EdgeInsets.only(
                top: 130,
                bottom: 20,
                left: 5,
                right: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LearnButton extends StatelessWidget {
  final String navigation;
  final String backgroundPicture;
  final String title;
  final dynamic locationPadding;
  final IconData iconShape;

  const LearnButton(
      {Key? key,
      required this.iconShape,
      required this.navigation,
      required this.backgroundPicture,
      required this.title,
      required this.locationPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Colors.teal,
        image: DecorationImage(
          image: AssetImage(
            backgroundPicture,
          ),
          fit: BoxFit.cover,
          alignment: Alignment(0.3, 0),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, navigation);
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(
            Color(0x006FE2D0),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: Container(
            child: Column(
              children: [
                Icon(
                  iconShape,
                  color: Colors.white,
                  size: 30,
                ),
                Text(
                  title,
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
            padding: locationPadding),
      ),
    );
  }
}
