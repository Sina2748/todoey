import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class CircleTeachingScreen extends StatelessWidget {
  const CircleTeachingScreen({Key? key}) : super(key: key);

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
              contentAlignment: Alignment.bottomRight,
              fontSize: 30,
              containerHeight: 100,
              contentViewerTitle: 'چرخ تعادل زندگی',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'زندگی هر کدوم از ما ابعاد مختلفی داره و رضایت ما از هر کدوم از اون ابعاد رضایت از زندگیمون رو می سازه و هر چی از وضعیت مطلوبمون فاصله بگیریم نارضایتی بیشتری رو تجربه می‌کنیم. حتما عبارت تعادل بین کار و زندگی تا حالا به گوشت خورده. چرخ زندگی نموداریه که بهمون کمک می‌کنه بین تمام ابعاد زندگی تعادل برقرار کنیم.',
              containerHeight: 150,
              fontSize: 18,
            ),
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
                  'assets/images/teach8task/01.jpg',
                  fit: BoxFit.cover,
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
              contentAlignment: Alignment.bottomRight,
              fontSize: 25,
              containerHeight: 100,
              contentViewerTitle: 'نمودار چرخه زندگی چطور رسم می‌شه؟',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'تعدادی از موضوعات و ابعاد مهم زندگی که برای خودت مهمه، مثل ورزش، مطالعه، تحصیلات و غیره رو لیست کن و توی هر کدام به خودت از ۱۰ امتیاز بده. این امتیاز می‌تونه از وقتی که برای اون بعد می‌گذاری و یا توجهی که بهش می‌کنی ساخته بشه. ',
              containerHeight: 150,
              fontSize: 18,
            ),
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
                  'assets/images/teach8task/02.jpg',
                  fit: BoxFit.cover,
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
              contentAlignment: Alignment.bottomRight,
              fontSize: 25,
              containerHeight: 100,
              contentViewerTitle: 'رسم امتیازها روی نمودار به چه شکله؟',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'بعد از ثبت امتیازها اون‌ها رو روی یک نمودار دایره‌ای نمایش بده. مرکز دایره صفر و شعاع دایره امتیاز ده رو بگیر. به طوری که بزرگی هر اسلایس از دایره نشانگر امتیاز هر یک از بعدهایی باشه که انتخاب کردی. ',
              containerHeight: 150,
              fontSize: 18,
            ),
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
                  'assets/images/teach8task/03.jpg',
                  fit: BoxFit.cover,
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
              contentAlignment: Alignment.bottomRight,
              fontSize: 25,
              containerHeight: 100,
              contentViewerTitle: 'نمودار چرخه زندگی چطوری تحلیل می شه؟',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'هرچه قدر شکلی که ساخته شده به دایره نزدیک‌تر باشه، تعادل بهتری در زندگی برقراره و اگه شکل کوتاه بلند باشه، جای کار بیشتری برای متعادل سازی داره. با توجه به شکل می‌تونی تصمیم بگیری که کدوم جنبه‌ نیاز به توجه بیشتری داره. مثلا باید کار رو بیشتری جدی بگیری، بیشتر تفریح کنی یا زمان کمتری برای دوست‌ها کنار بذاری.',
              containerHeight: 150,
              fontSize: 18,
            ),
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
                  'assets/images/teach8task/04.jpg',
                  fit: BoxFit.cover,
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
              contentAlignment: Alignment.bottomRight,
              fontSize: 25,
              containerHeight: 100,
              contentViewerTitle: 'یک نکته',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'البته لزوما یک دست بودن ابعاد زندگی اهمیت ويژه‌ای نداره، فقط اگه بعدی از زندگی باشه که ناخواسته توجه کمتری به اون داشتی اون رو بهت نمایش می ده و یاد آوری می کنه. نکته اونجاست که ممکنه برای هر کسی، با توجه به اولویت‌ها و اهدافش، جنبه‌های مختلفی در زندگی مهم باشه و برای اونها نمودار بکشه.',
              containerHeight: 150,
              fontSize: 18,
            ),
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
                  'assets/images/teach8task/05.jpg',
                  fit: BoxFit.cover,
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
              contentAlignment: Alignment.bottomRight,
              fontSize: 25,
              containerHeight: 100,
              contentViewerTitle: 'ابزار ما',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'ما برای اینکه کشیدن چرخ زندگی رو برای شما راحت کنیم، این ابزرا رو درست کردیم تا بتوانید راحت امتحانش کنید. می‌تونین ابعاد مختلف زندگی رو با توجه به اولویت‌های خودتون مشخص کنی و امتیاز بدین. اینجوری می‌تونین تشخیص بدی  چی نیاز به توجه بیشتری داره و براش برنامه‌ریزی کنین.   ',
              containerHeight: 150,
              fontSize: 18,
            ),
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
                  'assets/images/teach8task/06.jpg',
                  fit: BoxFit.cover,
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
              contentAlignment: Alignment.bottomRight,
              fontSize: 25,
              containerHeight: 100,
              contentViewerTitle: 'کاغذ و قلم یا دیجیتال؟',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  ' انتخاب با شماست. مزیت کاغذ و قلم در اینه که بدون باز کردن گوشی می‌تونید به لیست کارهاتون دست‌رسی داشته باشید. به این ترتیب تمرکزتون رو از دست نمی‌دین. مزیت گوشی هم اینه که همیشه همراه‌تون هست و می تونید توی دستگاه های دیگه هم بهش دسترسی داشته باشید.  ',
              containerHeight: 160,
              fontSize: 18,
            ),
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
                  'assets/images/teach8task/07.jpg',
                  fit: BoxFit.cover,
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
              contentViewerTitle: 'ابزار ما',
            ), //If you want to use your own Widget
            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
                contentAlignment: Alignment.topCenter,
                contentViewerTitle:
                    'ما هم یه نسخه از این ابزار ساختیم تا بتونید همینجا این روش رو امتحان کنید و اگر خوشتون اومده به استفاده از اون ادامه بدید. کافیه با زدن دکمه + کارهاتون رو به لیست اضافه کنید. بعد با نگه داشتن انگشت روی اونها جا به جاشون کنید.',
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
                  'assets/images/teach8task/01.jpg',
                  fit: BoxFit.cover,
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
            size: const Size.square(8.0),
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
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
