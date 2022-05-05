import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class PomodoroTeachingScreen extends StatelessWidget {
  const PomodoroTeachingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: IntroductionScreen(
        scrollPhysics:
            const BouncingScrollPhysics(), //Default is BouncingScrollPhysics
        pages: [
          PageViewModel(
            decoration: const PageDecoration(
              fullScreen: true,
            ),
            // title: 'Title of 1st Page', //Basic String Title
            titleWidget: const Text(
              'Title of 1st Page',
              style: TextStyle(color: Colors.white),
            ), //If you want to use your own Widget
            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const Text(
              'Body of 1st Page',
              style: TextStyle(color: Colors.white),
            ), //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
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
            footer: const Text(
              'Footer',
              style: TextStyle(color: Colors.white),
            ), //You can add button here for instance
          ),
          PageViewModel(
            decoration: const PageDecoration(
              fullScreen: true,
            ),
            // title: 'Title of 1st Page', //Basic String Title
            titleWidget: const Text(
              'Title of 1st Page',
              style: TextStyle(color: Colors.white),
            ), //If you want to use your own Widget
            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const Text(
              'Body of 1st Page',
              style: TextStyle(color: Colors.white),
            ), //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
              height: double.infinity,
              color: Colors.red,
              child: Image.asset(
                'assets/images/n2.jpg',
                fit: BoxFit.fill,
              ),
            ),
            useScrollView:
                true, //If you want to you can also wrap around Alignment
            reverse: false, //If widget Order is reverse - body before image
            footer: const Text(
              'Footer',
              style: TextStyle(color: Colors.white),
            ), //You can add button here for instance
          ),
          PageViewModel(
            decoration: const PageDecoration(
              fullScreen: true,
            ),
            // title: 'Title of 1st Page', //Basic String Title
            titleWidget: const Text(
              'Title of 1st Page',
              style: TextStyle(color: Colors.white),
            ), //If you want to use your own Widget
            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const Text(
              'Body of 1st Page',
              style: TextStyle(color: Colors.white),
            ), //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
              height: double.infinity,
              color: Colors.red,
              child: Image.asset(
                'assets/images/n3.jpg',
                fit: BoxFit.fill,
              ),
            ),
            useScrollView:
                true, //If you want to you can also wrap around Alignment
            reverse: false, //If widget Order is reverse - body before image
            footer: const Text(
              'Footer',
              style: TextStyle(color: Colors.white),
            ), //You can add button here for instance
          ),
          PageViewModel(
            decoration: const PageDecoration(
              fullScreen: true,
            ),
            // title: 'Title of 1st Page', //Basic String Title
            titleWidget: const Text(
              'Title of 1st Page',
              style: TextStyle(color: Colors.white),
            ), //If you want to use your own Widget
            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const Text(
              'Body of 1st Page',
              style: TextStyle(color: Colors.white),
            ), //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
              height: double.infinity,
              color: Colors.red,
              child: Image.asset(
                'assets/images/n4.jpg',
                fit: BoxFit.fill,
              ),
            ),
            useScrollView:
                true, //If you want to you can also wrap around Alignment
            reverse: false, //If widget Order is reverse - body before image
            footer: const Text(
              'Footer',
              style: TextStyle(color: Colors.white),
            ), //You can add button here for instance
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
        // onSkip: () {
        //   // You can also override onSkip callback
        // },
        showSkipButton: false, //Is the skip button should be display
        showNextButton: false,
        showDoneButton: false,
        skip: const Icon(Icons.skip_next),
        next: const Icon(
          Icons.forward,
          color: Colors.teal,
        ),
        done: Text(
          "Done",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.teal,
          ),
        ),

        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.teal,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 5.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
