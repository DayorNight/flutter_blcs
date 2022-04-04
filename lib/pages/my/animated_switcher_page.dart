import 'package:flutter/material.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';
import '../../common/utils/code.dart';
import '../../widgets/slide_transition_view.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  static const String keys = 'animatedSwitcher';
  const AnimatedSwitcherPage({Key? key}) : super(key: key);

  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}
class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {

  int _count1 = 1;
  int _count2 = 1;
  int _count3 = 1;
  int _count4 = 1;
  bool _isplay = true;
  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: S.of(context).animatedSwitcher,
      keys: AnimatedSwitcherPage.keys,
      logoColor: Theme.of(context).primaryColor,
      des: animatedSwitcherDes,
      code: animatedSwitcherCode,

      footerChild: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildFadeItem(),
              buildScaleItem(),
              buildSlideXItem(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildSlideYItem(),
              buildScaleImageItem(),
            ],
          )
        ],
      ),
      // footerChild: GridView(
      //   padding: EdgeInsets.all(10.r),
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //   ),
      //   children: [
      //
      //   ],
      // ),
    );
  }
  ///默认 淡入淡出
  Column buildFadeItem() {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: Text(
            '$_count1',
            //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
            key: ValueKey<int>(_count1),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),
          ),
        ),
        OutlinedButton(
            onPressed: () {
              setState(() {
                _count1++;
              });
            },
            child: Text('点击'))
      ],
    );
  }
  ///缩放
  Column buildScaleItem() {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          reverseDuration: Duration(milliseconds: 500),
          switchInCurve: Curves.linear,
          switchOutCurve: Curves.linear,
          transitionBuilder: (child, animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: Text(
            '$_count2',
            key: ValueKey<int>(_count2),
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50.sp),
          ),
        ),
        OutlinedButton(
            onPressed: () {
              setState(() {
                _count2++;
              });
            },
            child: Text('点击'))
      ],
    );
  }
  ///上下
  buildSlideYItem() {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransitionX(
              child: child,
              direction: AxisDirection.down, //上入下出
              position: animation,
            );
          },
          child: Text(
            '$_count3',
            key: ValueKey<int>(_count3),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),
          ),
        ),
        OutlinedButton(
            onPressed: () {
              setState(() {
                _count3++;
              });
            },
            child: Text('点击'))
      ],
    );
  }
  ///左右
  buildSlideXItem() {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransitionX(
              child: child,
              direction: AxisDirection.left, //上入下出
              position: animation,
            );
          },
          child: Text(
            '$_count4',
            key: ValueKey<int>(_count4),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),
          ),
        ),
        OutlinedButton(
            onPressed: () {
              setState(() {
                _count4++;
              });
            },
            child: Text('点击'))
      ],
    );
  }
  ///缩放图片
  buildScaleImageItem() {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          reverseDuration: Duration(milliseconds: 500),
          switchInCurve: Curves.linear,
          switchOutCurve: Curves.linear,
          transitionBuilder: (child, animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: Icon(_isplay?Icons.stop_circle_outlined:Icons.play_circle_fill_rounded,key: ValueKey<int>(_isplay?0:1),size: 60.r,),
        ),
        OutlinedButton(
            onPressed: () {
              setState(() {
                _isplay=!_isplay;
              });
            },
            child: Text('点击'))
      ],
    );
  }
}

