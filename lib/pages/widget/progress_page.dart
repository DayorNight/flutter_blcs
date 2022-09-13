import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_blcs/widgets/progress/level_progress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressPage extends StatelessWidget {
  static final String keys = "ProgressPage";

  const ProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: '进度条',
      keys: keys,
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
        value: 0.6,//当前进度值
        backgroundColor: Colors.grey,//进度背景色
        color: Theme.of(context).primaryColor,//进度颜色
        level: ["Lv1","Lv2","Lv3","Lv4","Lv5","Lv6"],//下面文字
        levelNum: ["10000","20000","30000","40000","50000","60000"],//上面文字
        minHeight: 3,//进度条高度
      )),
    ];
  }
}
