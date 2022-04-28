import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../common/utils/function.dart';
import '../../common/utils/navigator.dart';
import '../../generated/l10n.dart';
import 'login_page.dart';

class DemoPage extends StatefulWidget {
  static const String keys = 'demo';

  const DemoPage({Key? key}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  static const String imgUrl1= 'https://img.zcool.cn/community/01521b5af17218a801219b7f91cbec.jpg';
  static const String imgUrl2= 'https://images.pexels.com/photos/1024984/pexels-photo-1024984.jpeg';
  static const String imgUrl3= 'https://images.pexels.com/photos/1378723/pexels-photo-1378723.jpeg';
  static const String goBtn= "Let's Go !";
  static const String skip = 'Skip';
  static const String next = 'Next';
  static const String done = 'Done';
  @override
  Widget build(BuildContext context) {
    screenInit(context);
    return IntroductionScreen(
      pages: pages(context),
      showDoneButton: false,
      showSkipButton: false,
      showNextButton: false,
      showBackButton: false,//与skip互斥
      back: const Icon(Icons.arrow_back),
      skip: const Text(skip),
      next: const Text(next),
      done: const Text(done, style: TextStyle(fontWeight: FontWeight.bold)),
      onChange: (value) {
        //todo 页面切换监听
        print("onChange $value");
      },
      onDone: () {
        print("done");
      },
      onSkip: () {
        print("onSkip");
      },
      skipOrBackFlex: 0,
      nextFlex: 0,
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: false
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      //定义所有按钮样式
      baseBtnStyle: TextButton.styleFrom(
        primary: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }

  //引导页
  List<PageViewModel> pages(BuildContext context) {
    return [
      PageViewModel(
          title: S.of(context).appName,
          body: '',
          // image: Image.asset(Images.launchBg,height: 100.sh,fit:BoxFit.fill,),
          image: Image.network(imgUrl1,fit: BoxFit.cover,height: 100.sh,),
          decoration: const PageDecoration(
            contentMargin: EdgeInsets.zero,
              //   pageColor: Colors.blue,
              titleTextStyle: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 30),
                bodyTextStyle: TextStyle(fontSize: 20),
              fullScreen: true)),
      PageViewModel(
        title: '',
        body: '',
        image: Image.network(imgUrl2,fit: BoxFit.cover,height: 100.sh,),
        decoration: const PageDecoration(fullScreen: true),
      ),
      PageViewModel(
        title: '',
        body: '',
        image: Image.network(imgUrl3,fit: BoxFit.cover,height: 100.sh,),
        decoration: const PageDecoration(fullScreen: true),
        // bodyWidget: Center(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: const [
        //       Text("Click on "),
        //       Icon(Icons.edit),
        //       Text(" to edit a post"),
        //     ],
        //   ),
        // ),
        footer: Container(
          margin: EdgeInsets.only(top: 300.r),
          child: OutlinedButton(
            onPressed: _goLogin,
            child: const Text(goBtn),
          ),
        ),
      ),
    ];
  }

  //登录
  void _goLogin() {
    NavigatorUtils.fadePushAndRemove(context, LoginPage.keys);
  }
}
