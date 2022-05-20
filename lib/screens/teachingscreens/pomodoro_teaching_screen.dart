import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class PomodoroTeachingScreen extends StatelessWidget {
  const PomodoroTeachingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: IntroductionScreen(
        curve: Curves.fastOutSlowIn,
        scrollPhysics:
            const BouncingScrollPhysics(), //Default is BouncingScrollPhysics
        pages: [
          PageViewModel(
            decoration: const PageDecoration(
              fullScreen: true,
            ),
            titleWidget: const ContentViewer(
              contentAlignment: Alignment.bottomCenter,
              fontSize: 30,
              containerHeight: 50,
              contentViewerTitle: ' لیست کارهای ۸ تایی',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
                contentAlignment: Alignment.topCenter,
                contentViewerTitle:
                    'لیست کارهای ۸ تایی یه روش برنامه ریزی هست که هدفش تمرین برای ثبت کار و انجام کار هست.',
                containerHeight: 100,
                fontSize: 20),
            //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.1),
                ], begin: Alignment.bottomRight),
              ),
              height: double.infinity,
              color: Colors.red,
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/n1.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            useScrollView:
                true, //If you want to you can also wrap around Alignment
            reverse: false, //If widget Order is reverse - body before image
            // footer: const Text(
            //   'Footer',
            //   style: TextStyle(color: Colors.white),
            // ), //You can add button here for instance
          ),
          PageViewModel(
            decoration: const PageDecoration(
              fullScreen: true,
            ),
            titleWidget: const ContentViewer(
              contentAlignment: Alignment.bottomCenter,
              fontSize: 30,
              containerHeight: 50,
              contentViewerTitle: ' لیست کارهای ۸ تایی',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
                contentAlignment: Alignment.topCenter,
                contentViewerTitle:
                    'لیست کارهای ۸ تایی یه روش برنامه ریزی هست که هدفش تمرین برای ثبت کار و انجام کار هست.',
                containerHeight: 100,
                fontSize: 20),
            //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.1),
                ], begin: Alignment.bottomRight),
              ),
              height: double.infinity,
              color: Colors.red,
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/n2.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            useScrollView:
                true, //If you want to you can also wrap around Alignment
            reverse: false, //If widget Order is reverse - body before image
            // footer: const Text(
            //   'Footer',
            //   style: TextStyle(color: Colors.white),
            // ), //You can add button here for instance
          ),
          PageViewModel(
            decoration: const PageDecoration(
              fullScreen: true,
            ),
            titleWidget: const ContentViewer(
              contentAlignment: Alignment.bottomCenter,
              fontSize: 30,
              containerHeight: 150,
              contentViewerTitle: ' لیست کارهای ۸ تایی',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
                contentAlignment: Alignment.topCenter,
                contentViewerTitle:
                    'لیست کارهای ۸ تایی یه روش برنامه ریزی هست که هدفش تمرین برای ثبت کار و انجام کار هست.',
                containerHeight: 150,
                fontSize: 20),
            //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.1),
                ], begin: Alignment.bottomRight),
              ),
              height: double.infinity,
              color: Colors.red,
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/n3.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            useScrollView:
                true, //If you want to you can also wrap around Alignment
            reverse: false, //If widget Order is reverse - body before image
            // footer: const Text(
            //   'Footer',
            //   style: TextStyle(color: Colors.white),
            // ), //You can add button here for instance
          ),
          PageViewModel(
            decoration: const PageDecoration(
              fullScreen: true,
            ),
            titleWidget: const ContentViewer(
              contentAlignment: Alignment.bottomCenter,
              fontSize: 30,
              containerHeight: 150,
              contentViewerTitle: ' لیست کارهای ۸ تایی',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
                contentAlignment: Alignment.topCenter,
                contentViewerTitle:
                    'لیست کارهای ۸ تایی یه روش برنامه ریزی هست که هدفش تمرین برای ثبت کار و انجام کار هست.',
                containerHeight: 150,
                fontSize: 20),
            //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.1),
                ], begin: Alignment.bottomRight),
              ),
              height: double.infinity,
              color: Colors.red,
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/n3.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            useScrollView:
                true, //If you want to you can also wrap around Alignment
            reverse: false, //If widget Order is reverse - body before image
            // footer: const Text(
            //   'Footer',
            //   style: TextStyle(color: Colors.white),
            // ), //You can add button here for instance
          ),
          PageViewModel(
            decoration: const PageDecoration(
              fullScreen: true,
            ),
            titleWidget: const ContentViewer(
              contentAlignment: Alignment.bottomCenter,
              fontSize: 30,
              containerHeight: 150,
              contentViewerTitle: ' لیست کارهای ۸ تایی',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
                contentAlignment: Alignment.topCenter,
                contentViewerTitle:
                    'لیست کارهای ۸ تایی یه روش برنامه ریزی هست که هدفش تمرین برای ثبت کار و انجام کار هست.',
                containerHeight: 150,
                fontSize: 20),
            //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.1),
                ], begin: Alignment.bottomRight),
              ),
              height: double.infinity,
              color: Colors.red,
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/n1.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            useScrollView:
                true, //If you want to you can also wrap around Alignment
            reverse: false, //If widget Order is reverse - body before image
            // footer: const Text(
            //   'Footer',
            //   style: TextStyle(color: Colors.white),
            // ), //You can add button here for instance
          ),
          PageViewModel(
            decoration: const PageDecoration(
              fullScreen: true,
            ),
            // title: 'Title of 1st Page', //Basic String Title
            titleWidget: const ContentViewer(
              contentAlignment: Alignment.bottomCenter,
              fontSize: 30,
              containerHeight: 50,
              contentViewerTitle: ' لیست کارهای ۸ تایی',
            ), //If you want to use your own Widget
            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
                contentAlignment: Alignment.topCenter,
                contentViewerTitle:
                    'لیست کارهای ۸ تایی یه روش برنامه ریزی هست که هدفش تمرین برای ثبت کار و انجام کار هست.',
                containerHeight: 150,
                fontSize: 20), //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.1),
                ], begin: Alignment.bottomRight),
              ),
              height: double.infinity,
              color: Colors.red,
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/n4.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            useScrollView:
                true, //If you want to you can also wrap around Alignment
            reverse: false, //If widget Order is reverse - body before image
            //You can add button here for instance
          ),

          //List of PageViewModel
        ],

        //If you provide both rawPages and pages parameter, pages will be used.
        onChange: (e) {
          // When something changes
        },
        onDone: () {
          // When done button is press
          Navigator.pop(context);
        },
        onSkip: () {
          Navigator.pop(context);
        },
        showSkipButton: true, //Is the skip button should be display
        showNextButton: false,
        showDoneButton: true,
        skip: const Text(
          'خروج',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        next: const Icon(
          Icons.forward,
          color: Colors.teal,
        ),
        done: Text(
          "شروع ابزار",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),

        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.white,
            color: Colors.grey,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}

class ContentViewer extends StatelessWidget {
  final String contentViewerTitle;
  final double containerHeight;
  final double fontSize;
  final contentAlignment;

  const ContentViewer({
    required this.contentAlignment,
    required this.contentViewerTitle,
    required this.containerHeight,
    required this.fontSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      // color: Colors.green,
      alignment: contentAlignment,
      child: Text(
        contentViewerTitle,
        textAlign: TextAlign.start,
        textDirection: TextDirection.rtl,
        style: GoogleFonts.harmattan(
          color: Colors.white,
          textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}
