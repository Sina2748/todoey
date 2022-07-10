import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTeachingScreen extends StatelessWidget {
  const TaskTeachingScreen({Key? key}) : super(key: key);

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
              contentViewerTitle: 'مدیریت زمان با پومودورو',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'این روش یک چرخه زمانیه. اول ۲۵ دقیقه به انجام کارها اختصاص داده می‌شه. مرحله بعد ۵ دقیقه برای استراحت گذاشته می‌شه و بعد از پایان زمان استراحت دوباره همین مراحل تکرار می‌شه.',
              containerHeight: 150,
              fontSize: 18,
            ),
            //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.3),
                ], begin: Alignment.bottomRight),
              ),
              height: double.infinity,
              color: Colors.red,
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/teachpomodoro/01.webp',
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
              containerHeight: 30,
              contentViewerTitle: 'مراحل پومودورو',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'اول یه تایمر و لیست کارهایی که باید انجام بدین رو آماده کنین. بعد تایمر رو برای ۲۵ دقیقه تنظیم کنین و فقط روی انجام یک کار تمرکز کنین تا وقتی که زمان تمام بشه. وقتی زمان به پایان رسید یک علامت به نشانه انجام ۲۵ دقیقه کار  روی یک تکه کاغذ ثبت کنین و ۵ دقیقه استراحت کنین. بعد از ثبت چهارمین علامت ۳۰ دقیقه استراحت کنین.',
              containerHeight: 200,
              fontSize: 18,
            ),
            //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.3),
                ], begin: Alignment.bottomRight),
              ),
              height: double.infinity,
              color: Colors.red,
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/teachpomodoro/02.webp',
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
              containerHeight: 40,
              contentViewerTitle: 'فوت کوزه‌گری',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'اگر کاری که می‌خواهین انجام بدین در ۲۵ دقیقه تمام نمی‌شه اون را به قسمت‌های کوچک‌تر تقسیم کنین. ولی اگه کمتر از ۲۵ دقیقه وقت لازم داره سعی کنین چند کار ساده رو توی یک مقطع زمانی انجام بدین. یادتون باشه که نباید زمان کار رو زودتر از ۲۵ دقیقه تموم کنین. اگر زمان اضافه آمد اون را به دوره کردن درس و کارها اختصاص بدین. ',
              containerHeight: 200,
              fontSize: 18,
            ),
            //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.3),
                ], begin: Alignment.bottomRight),
              ),
              height: double.infinity,
              color: Colors.red,
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/teachpomodoro/03.webp',
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
              contentViewerTitle: 'پومودورو رو از کجا اومده؟',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'آقای چیریلو در سال ۱۹۸۰ تکنیک پومودورو رو زمانی که دانشجو بوده ابداع کرده و چون از زمان سنجی که شبیه گوجه فرنگی بوده برای اندازه‌گیری زمان استفاده می‌کرده اسم این روش رو پومودورو گذاشته، که به معنی گوجه فرنگی به زبان ایتالیاییه.  ',
              containerHeight: 150,
              fontSize: 18,
            ),
            //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.3),
                ], begin: Alignment.bottomRight),
              ),
              height: double.infinity,
              color: Colors.red,
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/teachpomodoro/04.webp',
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
              containerHeight: 40,
              contentViewerTitle: 'مزیت پومودورو در چیست؟',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'چیزی که این روش رو خیلی محبوب می‌کنه اصرارش به استمرار و دوری از کمال‌طلبیه. هر مقطع یه شروع جدیده که خودت رو به چالش بکشی و حواس پرتی‌هات رو حداقل کنی. مزیت دیگه‌ش کوچک کردن کارهای سخت و بزرگ به قدم‌های کوچک و قابل انجام است. نتیجه کار براش مهم نیست، فقط می‌گه بشین و حواست رو جمع کن و انجام بده. ',
              containerHeight: 200,
              fontSize: 18,
            ),
            //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.3),
                ], begin: Alignment.bottomRight),
              ),
              height: double.infinity,
              color: Colors.red,
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/teachpomodoro/05.webp',
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
              containerHeight: 70,
              contentViewerTitle: 'ادامه مزیت‌های پومودورو',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'نکته دیگرش کمک به واقعی کردن درک زمان است. ۵ دقیقه استراحت مثل ۳۵ ثانیه می‌گذره. ولی ۲۵ دقیقه درس و کار انگار یک ساعت نیم طول می‌کشه. پیدا کردن درک درست از از زمان کمک می‌کنه که توی پیش‌بینی زمان لازم برای انجام کارها دقیق‌تر عمل کنی.  ',
              containerHeight: 200,
              fontSize: 18,
            ),
            //If you want to use your own Widget
            //Page decoration Contain all page customizations
            image: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.3),
                ], begin: Alignment.bottomRight),
              ),
              height: double.infinity,
              color: Colors.red,
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/teachpomodoro/06.webp',
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
              contentAlignment: Alignment.bottomRight,
              fontSize: 25,
              containerHeight: 30,
              contentViewerTitle: 'ابزار ما',
            ), //If you want to use your own Widget
            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
                contentAlignment: Alignment.topCenter,
                contentViewerTitle:
                    'اپ‌های زیادی هستن که برای کمک به مدیریت زمان به روش پومودورو طراحی شدن. پیشنهاد شده برای کارهایی که به نیروی خلاقیت و تمرکز بیشتری نیاز داره، مثل کد نویسی، نویسندگی و آهنگسازی و غیره، بهتره زمان کار و استراحت افزایش پیدا کنه. ما هم این ابزار رو طراحی کردیم و این قابلیت رو براش در نظر گرفتیم تا راحت این روش رو امتحان کنید.',
                containerHeight: 200,
                fontSize: 18), //If you want to use your own Widget
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
