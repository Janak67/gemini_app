import 'package:advance_exam/utils/helper/share_helper.dart';
import 'package:advance_exam/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Coins Trap',
              body:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              image: Image.asset('assets/img/intro.png'),
              decoration: PageDecoration(
                  titleTextStyle: comic20, bodyTextStyle: comic20),
            ),
            PageViewModel(
              title: 'Save your money',
              body: 'by using this app you will be updated about coins prices',
              image: Image.asset('assets/img/intro1.png'),
              decoration: PageDecoration(
                  titleTextStyle: comic20, bodyTextStyle: comic20),
            ),
            PageViewModel(
              title: 'Save Your time',
              body:
                  'don\’t lose the time to now when you have to buy or sell coins',
              image: Image.asset('assets/img/intro2.png'),
              decoration: PageDecoration(
                  titleTextStyle: comic20, bodyTextStyle: comic20),
            ),
          ],
          showDoneButton: true,
          onDone: () {
            ShareHelper.shareHelper.setIntro();
            Get.offAllNamed('login');
          },
          showSkipButton: true,
          skipOrBackFlex: 0,
          nextFlex: 0,
          back: Icon(Icons.arrow_back),
          skip: Text('Skip', style: comic20),
          next: Text('Next', style: comic20),
          done: Text('Done', style: comic20),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: EdgeInsets.all(10),
          showNextButton: true,
        ),
      ),
    );
  }
}
