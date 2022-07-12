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
              contentAlignment: Alignment.bottomRight,
              fontSize: 30,
              containerHeight: 80,
              contentViewerTitle: ' لیست کارهای ۸ تایی',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'این روش خیلی ساده است، هر روز ۸ تا کار اصلی برای خودت تعریف می‌کنی و می‌نویسی. تا آخر روز باید همه رو انجام بدی و خط بزنی. فقط حواست باشه اگه نتونی کاری که نوشتی رو تا آخر روز انجام بدی، دیگه نمی‌تونی اون روز رو یه روز بدون نقص حساب کنی!',
              containerHeight: 200,
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
                  'assets/images/teach8task/01.webp',
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
              containerHeight: 80,
              contentViewerTitle: ' ممکنه هر روز ۸ تا کار نداشته باشی',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'بعد از چند وقت می‌بینی که انجام ۸ تا کار زیادتر از اون چیزیه که فکر می‌کردی و مشکله تو یه روز انجام‌شون داد. ولی نکته طلایی اینجاست که اجازه داری  کارها رو جوری تعریف کنی که کوچک باشه. مثلا به جای تصمیم به تموم کردن یک کتاب، بهتره بنویسی شروع کتاب، یا مطالعه ی یک فصل از کتاب. ',
              containerHeight: 200,
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
                  'assets/images/teach8task/02.webp',
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
              containerHeight: 80,
              contentViewerTitle:
                  'حالا چرا این روش بهتر از لیست کارهای معمولی هست؟',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'خوبی این روش اینه که مجبورت می‌کنه بری سراغ کارهایی که همیشه  می‌ذاری برای بعد. عقب انداختن چندباره‌ی کارها به فردا و شنبه و اول ماه باعث می‌شه تعداد کارهای تلنبار شده هی بیشتر و بیشتر بشه و آدم بترسه که بره سراغشون. ',
              containerHeight: 200,
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
                  'assets/images/teach8task/03.webp',
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
              containerHeight: 80,
              contentViewerTitle: 'روزهای کاملت رو بشمار',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'هر روزی که تونستی هر ۸ تا کار رو انجام بدی به‌عنوان یک روز کامل بشمار. بعد دنبال کن ببین چند روز هست که روز ناقص نداشتی و زنجیره روزهای کامل رو ادامه دادی. حواست باشه اگه یه روز ناقص داشته باشی باید زنجیره رو از اول شروع کنی .  ',
              containerHeight: 200,
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
                  'assets/images/teach8task/04.webp',
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
              containerHeight: 80,
              contentViewerTitle: 'چرا شمردن روزهای کامل مهمه',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'وقی روزهای کامل رو بشماری و مثلا به روز ۱۰۰ ام بررسی دیگه دلت نمی‌یاد روز ناقص پیدا کنی. چون باید از اول شروع کنی و رکوردت رو از دست می‌دی. اینجوری راحت تر می‌شینی سر کارها. انگار که داری با خودت تو زنجیره نگه داشتن  رقابت می کنی. ',
              containerHeight: 200,
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
                  'assets/images/teach8task/05.webp',
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
              containerHeight: 80,
              contentViewerTitle: 'این روش از کجا اومده؟',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  'ما این روش رو اولین بار از کانال یوتوب پیتر مک‌کنین یاد گرفتیم. ولی گویا آقای اندی فریزلا توی چالش ۷۵ روز سخت هم به این روش اشاره کرده. یه کتاب هم در سال ۲۰۲۱ با اسم eight critical tasks منتشر شده.   ',
              containerHeight: 200,
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
                  'assets/images/teach8task/06.webp',
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
              containerHeight: 80,
              contentViewerTitle: 'کاغذ و قلم یا دیجیتال؟',
            ), //Basic String Title

            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
              contentAlignment: Alignment.topCenter,
              contentViewerTitle:
                  ' انتخاب با شماست. مزیت کاغذ و قلم در اینه که بدون باز کردن گوشی می‌تونید به لیست کارهاتون دست‌رسی داشته باشید. به این ترتیب تمرکزتون رو از دست نمی‌دین. مزیت گوشی هم اینه که همیشه همراه‌تون هست و می تونید توی دستگاه های دیگه هم بهش دسترسی داشته باشید.  ',
              containerHeight: 200,
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
                  'assets/images/teach8task/07.webp',
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
              containerHeight: 80,
              contentViewerTitle: 'ابزار ما',
            ), //If you want to use your own Widget
            // body: 'Body of 1st Page', //Basic String Body
            bodyWidget: const ContentViewer(
                contentAlignment: Alignment.topCenter,
                contentViewerTitle:
                    'ما هم یه نسخه از این ابزار ساختیم تا بتونید همینجا این روش رو امتحان کنید و اگر خوشتون اومده به استفاده از اون ادامه بدید. کافیه با زدن دکمه + کارهاتون رو به لیست اضافه کنید. بعد با نگه داشتن انگشت روی اونها جا به جاشون کنید.',
                containerHeight: 200,
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
                  'assets/images/teach8task/todo.webp',
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
        done: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/taskscreen');
          },
          child: Text(
            "شروع ابزار",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
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
