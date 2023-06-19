import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

class NotificationPage extends StatefulWidget {
  static const keys = 'NotificationPage';
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {


  @override
  Widget build(BuildContext context) {
    return ArticleModel(
        logoColor: Theme.of(context).primaryColor,
        title: S.current.notification_title,
        keys: NotificationPage.keys,
        footerChild: Column(
          children: [
            commonButton(content: 'BrnNoticeBar', des: '通知视图'),
            BrnNoticeBar(
              content: '这是通知内容',
              noticeStyle: NoticeStyles.runningWithArrow,
              onNoticeTap: () {
                BrnToast.show('点击通知', context);
              },
              onRightIconTap: () {
                BrnToast.show('点击右侧图标', context);
              },
            ),
            Text('隐藏左右图标'),
            BrnNoticeBar(
              content: '这是通知内容',
              showLeftIcon: false ,
              showRightIcon: false,
              noticeStyle: NoticeStyles.runningWithArrow,
              onNoticeTap: () {
                BrnToast.show('点击通知', context);
              },
              onRightIconTap: () {
                BrnToast.show('点击右侧图标', context);
              },
            ),
            Text('自定义图标和文字、背景颜色'),
            BrnNoticeBar(
              content: '这是通知内容',
              textColor: Colors.indigo, ///通知颜色
              leftWidget: BrunoTools.getAssetImage(BrnAsset.iconMore),  ///左侧图标
              rightWidget: BrunoTools.getAssetImage(BrnAsset.iconMore), ///右侧图标
              onNoticeTap: () {
                BrnToast.show('点击通知', context);
              },
              onRightIconTap: () {
                BrnToast.show('点击右侧图标', context);
              },
            ),
            Text('跑马灯'),
            BrnNoticeBar(
              content: '这是跑马灯的通知内容跑马灯的通知内容跑马灯的通知内容跑马灯的通知内容',
              marquee: true,
              noticeStyle: NoticeStyles.runningWithArrow,
              onNoticeTap: () {
                BrnToast.show('点击通知', context);
              },
              onRightIconTap: () {
                BrnToast.show('点击右侧图标', context);
              },
            ),
            commonButton(content: 'BrnNoticeBarWithButton', des: '左边标签，右边按钮的通知视图。'),
            BrnNoticeBarWithButton(
              leftTagText: '任务',
              content: '这是通知内容',
              rightButtonText: '去完成',
              onRightButtonTap: () {
                BrnToast.show('点击右侧按钮', context);
              },
            ),
            Text('自定义文字和背景颜色'),
            BrnNoticeBarWithButton(
              leftTagText: '任务',
              leftTagBackgroundColor: Color(0xFFE0EDFF),
              leftTagTextColor: Color(0xFF0984F9),
              content: '这是通知内容这是通知内容这是通知内容这是通知内容这是通知内容',
              backgroundColor: Color(0xFFEBFFF7),
              contentTextColor: Color(0xFF00AE66),
              rightButtonText: '去完成',
              rightButtonBorderColor: Color(0xFF0984F9),
              rightButtonTextColor: Color(0xFF0984F9),
              onRightButtonTap: () {
                BrnToast.show('点击右侧按钮', context);
              },
            ),
            Text('跑马灯'),
            BrnNoticeBarWithButton(
              leftTagText: '任务',
              content: '这是跑马灯的通知内容跑马灯的通知内容跑马灯的通知内容跑马灯的通知内容',
              rightButtonText: '去完成',
              marquee: true,
              onRightButtonTap: () {
                BrnToast.show('点击右侧按钮', context);
              },
            ),
          ],
        ));
  }


}
