import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/navigator.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

class TabsPage extends StatefulWidget {
  static final String keys = "TabsPage";

  const TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with SingleTickerProviderStateMixin{
  List<ItemEntity> lists = [
    ItemEntity(name: "顶部Tabs", value: "顶部Tabs"),
    ItemEntity(name: "底部Tabs", value: "底部Tabs"),
    // ItemEntity(value: ""),
    // ItemEntity(value: ""),
  ];
  String? _selection = "顶部Tabs";
  late TabController tabController;
  List<BadgeTab> tabs = [BadgeTab(text: "需求1", badgeNum: 26),BadgeTab(text: "需求2")];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: 'Tabs',
      keys: TabsPage.keys,
      logoColor: Theme.of(context).primaryColor,
      headerChild: BrnSimpleSelection.radio(
        menuName: lists[0].name,
        menuKey: lists[0].name,
        items: lists,
        defaultValue: lists[0].name,
        onSimpleSelectionChanged: (List<ItemEntity> filterParams) {
          _selection = filterParams.first.value;
        },
      ),
      footerChild: Column(
        children: _listWidget(context),
      ),
    );
  }

  _listWidget(BuildContext context) {
    print("_selection $_selection");
    switch (_selection) {
      case "顶部Tabs":
        return topBar(context);
      case "底部Tabs":
        return bottomBar(context);
    }
  }

  ///顶部导航
  topBar(BuildContext context) {
    return [
      commonButton(
          content: "TabBar + TabBarView",
          des: "选项卡",
          onTop: () => NavigatorUtils.toClass(context, TabBarDemo())),
      //https://bruno.ke.com/page/v2.2.0/widgets/brn-tab-bar
      commonButton(
          content: "BrnTabBar",
          des: "文字+角标",),
      // _brnTabBar(),
    ];
  }

  ///底部导航
  bottomBar(BuildContext context) {
    return [
      Text("XXXXXX"),
      Text("XXXXXX"),
    ];
  }

  _brnTabBar() {
    return BrnTabBar(
      controller: tabController,
      tabs: tabs,
      onTap: (state, index) {
        state.refreshBadgeState(index);
      },
    );
  }
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SizedBox();
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
