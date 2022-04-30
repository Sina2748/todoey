import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:todoey/utils/constants.dart';

class TabBarTools extends StatelessWidget {
  const TabBarTools({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBackgroundImage,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonWithPicture(
                    pictureAddress:
                        'https://www.humangest.it/images/To-do-list.jpg',
                    colorFilterMode: ColorFilter.mode(
                        Colors.deepPurple[400]!, BlendMode.overlay),
                    navigatTo: '/taskscreen',
                    textTitle: 'TO DO List',
                    iconTitle: Icons.list,
                    buttonHight: 200.0,
                  ),
                  ButtonWithPicture(
                    pictureAddress:
                        'https://crepin.ir/wp-content/uploads/2020/11/DSC_6548-2-1.jpg',
                    colorFilterMode: ColorFilter.mode(
                        Colors.purple[400]!, BlendMode.colorBurn),
                    navigatTo: '/taskscreen',
                    textTitle: 'Bullet Journal',
                    iconTitle: Icons.menu_book,
                    buttonHight: 100.0,
                  ),
                  ButtonWithPicture(
                    pictureAddress:
                        'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTX-6FlB_URfm0xzk7yz2wdpllefHqJs02cwqOiNuNCi2rLW4TU',
                    colorFilterMode: ColorFilter.mode(
                        Colors.indigo[400]!, BlendMode.colorBurn),
                    navigatTo: '/lifebalancescreen',
                    textTitle: 'Balance Of Life',
                    iconTitle: Icons.circle_notifications,
                    buttonHight: 150.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ButtonWithPicture(
                    pictureAddress:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkEdvhj1__eimJTZPaRsBFJreV4IRuPM6KLg&usqp=CAU',
                    colorFilterMode:
                        ColorFilter.mode(Colors.red[900]!, BlendMode.overlay),
                    navigatTo: '/taskscreen',
                    textTitle: 'Pomodoro',
                    iconTitle: Icons.access_alarms_sharp,
                    buttonHight: 250.0,
                  ),
                  ButtonWithPicture(
                    pictureAddress:
                        'https://pbs.twimg.com/profile_images/881291788744445952/LIMXum0r_400x400.jpg',
                    colorFilterMode:
                        ColorFilter.mode(Colors.red[900]!, BlendMode.overlay),
                    navigatTo: '/taskscreen',
                    textTitle: 'Ikigay',
                    iconTitle: Icons.data_usage,
                    buttonHight: 345.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonWithPicture extends StatelessWidget {
  final String pictureAddress;
  final colorFilterMode;
  final navigatTo;
  final textTitle;
  final iconTitle;
  final buttonHight;

  const ButtonWithPicture({
    required this.pictureAddress,
    required this.colorFilterMode,
    required this.navigatTo,
    required this.textTitle,
    required this.iconTitle,
    required this.buttonHight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Colors.teal,
        image: DecorationImage(
          image: NetworkImage(pictureAddress),
          fit: BoxFit.cover,
          alignment: Alignment(0.3, 0),
          colorFilter: colorFilterMode,
        ),
      ),
      margin: EdgeInsets.all(6),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Color(0x856FE2D0)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, navigatTo);
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 10,
            bottom: buttonHight,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Icon(
                iconTitle,
                size: 30,
              ),
              Text(
                textTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.lemonada(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
