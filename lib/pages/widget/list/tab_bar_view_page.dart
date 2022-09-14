import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/navigator.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/pages/widget/tabs_page.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

const String tabBarViewCode = '''
const TabBarView({
	Key? key,
	// tab 页
	required List<Widget> children,	
	// 用于监听和控制 TabBarView 的页面切换 通常和 TabBar 联动
	TabController? controller,
  // 决定当用户达到最大滚动范围或当用户停止滚动时，Scrollable将如何运行。
	ScrollPhysics? physics,
  // 确定处理拖动启动行为的方式。
	DragStartBehavior dragStartBehavior = DragStartBehavior.start
  // 每个页面应该占据的视口比例
	double viewportFraction = 1.0,
	// 裁剪行为
	Clip clipBehavior = Clip.hardEdge,
})
''';

class TabBarViewPage extends StatelessWidget {
  static final String keys = "TabBarViewPage";

  const TabBarViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: 'TabBarView',
      keys: keys,
      logoColor: Theme.of(context).primaryColor,
      des: "显示与当前选定选项卡对应的小部件的页面视图\n通常与TabBar配合使用",
      code: tabBarViewCode,
      headerChild: commonButton(
          content: "TabBar + TabBarView",
          des: "选项卡",
          onTop: () => NavigatorUtils.toClass(context, TabBarDemo())),
    );
  }
}
