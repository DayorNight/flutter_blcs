import 'package:flutter/material.dart';

import '../../widgets/animation/stagger_animation.dart';

class MixedAnimationView extends StatefulWidget {

  static const String keys = 'routeAnimationView';

  const MixedAnimationView({Key? key}) : super(key: key);

  @override
  _MixedAnimationViewState createState() => _MixedAnimationViewState();
}

class _MixedAnimationViewState extends State<MixedAnimationView> with TickerProviderStateMixin{
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 2000),vsync: this);
  }

  _playAnimation() async{
    try {
      //正向执行动画
      await _controller.forward().orCancel;
      //反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => _playAnimation(),
            child: Text("start animation"),
          ),
          Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            //调用我们定义的交错动画Widget
            child: StaggerAnimation(controller: _controller),
          ),
        ],
      ),
    );
  }
}
