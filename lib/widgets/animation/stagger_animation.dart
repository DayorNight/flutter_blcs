import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaggerAnimation extends StatelessWidget {

  final AnimationController controller;
  late final Animation<double> sizeAnimation;
  late final Animation<EdgeInsets> paddingAnimation;
  late final Animation<Color?> colorAnimation;

  StaggerAnimation({Key? key,required this.controller}) : super(key: key){
    sizeAnimation = Tween<double>(begin: 0.r,end: 300.r,).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.6,curve: Curves.ease)));
    colorAnimation = ColorTween(begin: Colors.green,end: Colors.red).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.6,curve: Curves.ease)));
    paddingAnimation = Tween<EdgeInsets>(begin: EdgeInsets.only(left: 0),end: EdgeInsets.only(left: 100.r)).animate(CurvedAnimation(parent: controller, curve: Interval(0.6, 1.0,curve: Curves.ease)));

  }

  Widget _builder(BuildContext context,child){
    return Container(
      alignment: Alignment.bottomCenter,
      padding: paddingAnimation.value,
      child: Container(
        color: colorAnimation.value,
        width: 50.0,
        height: sizeAnimation.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _builder);
  }
}
