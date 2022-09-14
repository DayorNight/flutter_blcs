import 'package:flutter/material.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

const String scaffoldPageCode = '''
const Scaffold({
	Key? key,
	// 页面顶部显示应用栏
	PreferredSizeWidget? appBar,	
	// 显示页面内容 在appBar下方
	Widget? body,	
	// 浮动按钮
	Widget? floatingActionButton,	
	// 定义浮动按钮位置
	FloatingActionButtonLocation? floatingActionButtonLocation, 
	// 定义浮动按钮动画
	FloatingActionButtonAnimator? floatingActionButtonAnimator,	
	// 显示一组按钮在底部导航栏上方
	List<Widget>? persistentFooterButtons,
	// 抽屉 侧边栏  隐藏在左侧方
	Widget? drawer,	
	// 左抽屉打开关闭回调
	DrawerCallback? onDrawerChanged,	
	// 抽屉 侧边栏  隐藏在右侧方
	Widget? endDrawer,	
	// 右抽屉打开关闭回调
	DrawerCallback? onEndDrawerChanged,
	// 底部导航栏
	Widget? bottomNavigationBar,	
	// 持久在body下方，底部控件上方的控件
	Widget? bottomSheet,
	// 背景色
	Color? backgroundColor, 
	// 如果为 true，主体和脚手架的浮动小部件应自行调整大小以避免屏幕键盘的高度
	bool? resizeToAvoidBottomInset,		
	// 如果为true，则appBar的高度将被屏幕状态栏的高度所扩展
	bool primary = true,		
	// 定义抽屉 拖，拽行为
	DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start, 
	// 判断是否扩展body内容至底部
	bool extendBody = false,	
	// 判断是否扩展body内容至AppBar
	bool extendBodyBehindAppBar = false,	
	// 判断是否扩展body内容至AppBar
	Color? drawerScrimColor,	
	// 水平滑动将打开抽屉的区域的宽度。
	double? drawerEdgeDragWidth,	
	// 判断是否可以打开左抽屉
	bool drawerEnableOpenDragGesture = true, 
	// 判断是否可以打开右抽屉
	bool endDrawerEnableOpenDragGesture = true,
	// 判断是否可以打开右抽屉
	String? restorationId	
})
''';

class ScaffoldPage extends StatelessWidget {
  static final String keys = "ScaffoldPage";

  const ScaffoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: 'Scaffold',
      keys: keys,
      logoColor: Theme.of(context).primaryColor,
      des: "脚手架，实现页面的快速搭建",
      code: scaffoldPageCode,
    );
  }
}
