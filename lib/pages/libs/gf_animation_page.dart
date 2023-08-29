
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_state_widget.dart';
import 'package:flutter_blcs/generated/assets.dart';
import 'package:getwidget/components/animation/gf_animation.dart';
import 'package:getwidget/types/gf_animation_type.dart';

class GFAnimationPage extends BasePageStateWidget{
  static const keys = 'GFAnimationPage';

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => 'GFAnimation';
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initStateTicker(TickerProvider vsync) {
    super.initStateTicker(vsync);
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: vsync);
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);
    controller.repeat();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget? buildBody(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
            onTap: () {
              controller.repeat();
            },
            child: GFAnimation(
              turnsAnimation: animation,
              controller: controller,
              type: GFAnimationType.rotateTransition,
              alignment: Alignment.center,
              child: Image.asset(
                Assets.imagesIcAvator,
                width: 80,
                height: 80,
              ),
            ),
          ),
        SizedBox(height: 10,),
        GestureDetector(
          onTap: () {
            controller.repeat();
          },
          child: GFAnimation(
            scaleAnimation: animation,
            controller: controller,
            type: GFAnimationType.scaleTransition,
            child: Image.asset(
              Assets.imagesIcAvator,
              width: 80,
              height: 80,
            ),
          ),
        ),
        SizedBox(height: 10,),
        GFAnimation(
          duration: Duration(seconds: 2),
          alignment: Alignment.bottomLeft,
          type: GFAnimationType.align,
          child: Image.asset(
            Assets.imagesIcAvator,
            width: 80,
            height: 80,
          ),
        ),
        SizedBox(height: 10,),
        GFAnimation(
          controller: controller,
          type: GFAnimationType.slideTransition,
          child: Image.asset(
            Assets.imagesIcAvator,
            width: 80,
            height: 80,
          ),
        ),
        SizedBox(height: 10,),
        GFAnimation(
          onTap: () {
          },
          width: 100,
          height: 100,
          type: GFAnimationType.size,
          controller: controller,
          child: Image.asset(
            Assets.imagesIcAvator,
            width: 80,
            height: 80,
          ),
        ),
        SizedBox(height: 10,),
        GFAnimation(
          width: 50,
          changedWidth: 100,
          height: 50,
          changedHeight: 100,
          activeColor: Colors.transparent,
          color: Colors.transparent,
          type: GFAnimationType.container,
          child: Image.asset(
            Assets.imagesIcAvator,
            width: 80,
            height: 80,
          ),
        ),
        SizedBox(height: 10,),
        GFAnimation(
          duration: Duration(seconds: 2),
          alignment: Alignment.bottomLeft,
          type: GFAnimationType.align,
          child: Image.asset(
            Assets.imagesIcAvator,
            width: 80,
            height: 80,
          ),
        ),

      ],
    );
  }
}