import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/code.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../generated/l10n.dart';
import '../../widgets/animation/image_size_animation.dart';

class AnimationPage extends StatefulWidget {
  static const String keys = 'animationView';

  const AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    //1.创建动画控制器
    controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    //2.创建动画执行过程
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    //3.定义动画范围
    animation = Tween(begin: 100.r, end: 200.r).animate(animation)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //动画执行结束时反向执行动画
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          //动画恢复到初始状态时执行动画（正向）
          controller.forward();
        }
      });
    //4.启动动画
    controller.forward();
  }

  @override
  void dispose() {
    //5.释放动画资源
    controller.dispose();
    super.dispose();
  }
  /**
   * 播放动画
   */
  void _play() {
    if (controller.isAnimating) return;
    if (animation.status == AnimationStatus.reverse) {
      controller.reverse();
    } else if (animation.status == AnimationStatus.forward) {
      controller.forward();
    }
  }

  /**
   * 停止动画
   */
  void _stop() {
    if (controller.isAnimating) {
      controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: S.of(context).animation,
      keys: AnimationPage.keys,
      logoColor: Theme.of(context).primaryColor,
      des: AnimationDes,
      code: AnimationCode,
      headerChild: Container(
        height: 350.r,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    iconSize: 80.r,
                    onPressed: _play,
                    icon: Icon( Icons.play_circle_outline_rounded)),
                SizedBox(
                  width: 50.r,
                ),
                IconButton(
                    iconSize: 80.r,
                    onPressed: _stop,
                    icon: Icon(Icons.pause_circle_outline_rounded)),
              ],
            ),
            Row(
              children: [
                AnimatedImage(
                  listenable: animation,
                ),
                AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return Center(
                        child: Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                          size: animation.value,
                        ),
                      );
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

