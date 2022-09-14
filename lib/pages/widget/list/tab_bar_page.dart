import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/navigator.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/pages/widget/tabs_page.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

const String tabBarCode = '''
  const TabBar(
  {
    Key? key,
    // 两个多个的Tab列表	
    required List<Widget> tabs,
    // 控制tab的控制器
    TabController? controller,
    // 标签栏是否可以水平滚动
    bool isScrollable = false,
    // 内边距
    EdgeInsetsGeometry? padding,
    // 设置选中Tab指示器的颜色
    Color? indicatorColor,
    // 是否自动调整indicatorColor
    bool automaticIndicatorColorAdjustment = true,
    // 设置选中Tab指示器线条的粗细
    double indicatorWeight = 2.0,
    // 设置选中Tab指示器间距，默认值为 EdgeInsets.zero
    EdgeInsetsGeometry indicatorPadding = EdgeInsets.zero,
    // 设置选中Tab指示器的外观
    Decoration? indicator,
    // 设置选中Tab指示器的大小
    TabBarIndicatorSize? indicatorSize,
    // 设置选中Tab文字的颜色	
    Color? labelColor,
    // 设置选中Tab文字的样式	
    TextStyle? labelStyle,
    // 设置选中Tab文字的间距
    EdgeInsetsGeometry? labelPadding,
    // 设置未选中Tab文字的颜色
    Color? unselectedLabelColor,
    // 设置未选中Tab文字的样式
    TextStyle? unselectedLabelStyle,
    // 处理拖动开始行为的方式
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    // 定义响应焦点、悬停和飞溅颜色
    MaterialStateProperty<Color?>? overlayColor,
    // 鼠标指针进入或悬停在鼠标指针上时的光标
    MouseCursor? mouseCursor,
    // 检测到的手势是否应提供声音和/或触觉反馈
    bool? enableFeedback,
    // 单击Tab时的回调
    ValueChanged<int>? onTap,
    // TabBar的滚动视图如何响应用户输入
    ScrollPhysics? physics,
    // 点击tab时，定义产生的飞溅效果： 通过NoSplash.splashFactory 取消
    InteractiveInkFeatureFactory? splashFactory,
    // 定义点击时飞溅效果裁剪效果
    BorderRadius? splashBorderRadius
  }
)
''';

class TabBarPage extends StatelessWidget {
  static final String keys = "TabBarPage";

  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: 'TabBar',
      keys: keys,
      logoColor: Theme.of(context).primaryColor,
      des: "一个水平行的选项卡，通常应用在AppBar.bottom部分且与TabBarView结合使用",
      code: tabBarCode,
      headerChild: commonButton(
          content: "TabBar + TabBarView",
          des: "选项卡",
          onTop: () => NavigatorUtils.toClass(context, TabBarDemo())),
    );
  }
}
