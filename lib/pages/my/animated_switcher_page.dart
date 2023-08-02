import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_state_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../generated/l10n.dart';
import '../../common/utils/code.dart';
import '../../widgets/slide_transition_view.dart';

class AnimatedSwitcherPage extends BasePageStateWidget {
  static const String keys = 'animatedSwitcher';

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.animatedSwitcher;

  @override
  String? get getDes => animatedSwitcherDes;

  @override
  String? get getCode => animatedSwitcherCode;
  ValueNotifier<int> _count1 = ValueNotifier(1);
  ValueNotifier<int> _count2 = ValueNotifier(1);
  ValueNotifier<int> _count3 = ValueNotifier(1);
  ValueNotifier<int> _count4 = ValueNotifier(1);
  ValueNotifier<bool> _isplay = ValueNotifier(true);

  @override
  Widget? buildBody(BuildContext context) {
    return Column(
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
    );
  }

  ///默认 淡入淡出
  Column buildFadeItem() {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: ValueListenableBuilder<int>(
            valueListenable: _count1,
            builder: (_,value,__){
              return Text(
                '$value',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(value),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),
              );
            },
          ),
        ),
        OutlinedButton(
            onPressed: () {
              _count1.value= _count1.value++;
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
          child: ValueListenableBuilder<int>(
            valueListenable: _count2,
            builder: (context,value,__) {
              return Text(
                '$value',
                key: ValueKey<int>(value),
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50.sp),
              );
            }
          ),
        ),
        OutlinedButton(
            onPressed: () {
              _count2.value = _count2.value++;
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
          child: ValueListenableBuilder<int>(
            valueListenable: _count3,
            builder: (context,value,_) {
              return Text(
                '$value',
                key: ValueKey<int>(value),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),
              );
            }
          ),
        ),
        OutlinedButton(
            onPressed: () {
              _count3.value = _count3.value++;
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
          child: ValueListenableBuilder<int>(
            valueListenable: _count4,
            builder: (context,value,__) {
              return Text(
                '$value',
                key: ValueKey<int>(value),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),
              );
            }
          ),
        ),
        OutlinedButton(
            onPressed: () {
              _count4.value = _count4.value++;
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
          child: ValueListenableBuilder<bool>(
            valueListenable: _isplay,
            builder: (context,value,_) {
              return Icon(value?Icons.stop_circle_outlined:Icons.play_circle_fill_rounded,key: ValueKey<int>(value?0:1),size: 60.r,);
            }
          ),
        ),
        OutlinedButton(
            onPressed: () {
              _isplay.value = !_isplay.value;
            },
            child: Text('点击'))
      ],
    );
  }

}

