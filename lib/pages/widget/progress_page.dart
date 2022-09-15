import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_blcs/widgets/progress/level_progress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressPage extends StatefulWidget {
  static final String keys = "ProgressPage";

  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> with TickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: '进度条',
      keys: ProgressPage.keys,
      logoColor: Theme.of(context).primaryColor,
      headerChild: Column(
        children: _listWidget(context),
      ),
    );
  }

  List<Widget> _listWidget(BuildContext context) {
    return [
      commonButton(content: "等级进度条", des: "等级评定"),
      SizedBox(
        height: 40.w,
      ),
      Padding(padding: EdgeInsets.all(30.w), child: LevelProgressIndicator(
        value: controller.value,//当前进度值
        backgroundColor: Colors.grey,//进度背景色
        color: Theme.of(context).primaryColor,//进度颜色
        level: ["Lv1","Lv2","Lv3","Lv4","Lv5","Lv6"],//下面文字
        levelNum: ["10000","20000","30000","40000","50000","60000"],//上面文字
        minHeight: 3,//进度条高度
      )),
      SizedBox(
        height: 40.w,
      ),
      commonButton(content: "LinearProgressIndicator", des: "线性进度条"),
      SizedBox(
        height: 10.w,
      ),
      LinearProgressIndicator(
        value: controller.value,
        backgroundColor: Colors.grey,
        color: Colors.blue,
        minHeight: 15,
      ),
      SizedBox(
        height: 30.w,
      ),
      commonButton(content: "CircularProgressIndicator", des: "圆形进度条"),
      SizedBox(
        height: 10.w,
      ),
      CircularProgressIndicator(
        value: controller.value,
        backgroundColor: Colors.grey,
        color: Colors.blue,
      ),
      SizedBox(
        height: 30.w,
      ),
    ];
  }
}
