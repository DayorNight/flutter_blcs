import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

class NavigationPage extends StatefulWidget {
  static final String keys = "NavigationPage";

  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  List<ItemEntity> lists = [
    ItemEntity(name: "顶部导航",value: "顶部导航"),
    ItemEntity(name: "底部导航",value: "底部导航"),
    // ItemEntity(value: ""),
    // ItemEntity(value: ""),
  ];
  String? _selection;
  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: '导航',
      keys: NavigationPage.keys,
      logoColor: Theme.of(context).primaryColor,
      headerChild: BrnSimpleSelection.radio(
        menuName: lists[0].name,
        menuKey:  lists[0].name,
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
      switch (_selection) {
        case "顶部导航":
          return topBar(context);
        case "底部导航":
          return bottomBar(context);
      }
  }
  ///顶部导航
  topBar(BuildContext context) {
    return [

    ];
  }

  var titles = ['One', 'Two', 'Three', 'Four', 'Five','Six'];
  ///底部导航
  bottomBar(BuildContext context) {
    return [
      // BrnBottomTabBar(
      //   fixedColor: Colors.blue,
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemSelected,
      //   badgeColor: Colors.red,
      //   items: <BottomTabBarItem>[
      //     BottomTabBarItem(
      //         icon: Image(image: AssetImage("assets/icons/navbar\_fangyuan.png")),activeIcon: Image(image: AssetImage("assets/icons/navbar\_fangyuan.png")), title: Text(titles[0])),
      //     BottomTabBarItem(icon: Image(image: AssetImage("assets/icons/navbar\_fangyuan.png")), title: Text(titles[1])),
      //     BottomTabBarItem(icon: Image(image: AssetImage("assets/icons/navbar\_fangyuan.png")), title: Text(titles[2])),
      //     BottomTabBarItem(
      //         icon: Image(image: AssetImage("assets/icons/navbar\_fangyuan.png")),
      //         activeIcon: Image(image: AssetImage("assets/icons/navbar\_fangyuan.png")),
      //         title: Text(titles[3])),
      //     BottomTabBarItem(icon: Image(image: AssetImage("assets/icons/navbar\_fangyuan.png")), title: Text(titles[4])),
      //     BottomTabBarItem(icon: Image(image: AssetImage("assets/icons/navbar\_fangyuan.png")), title: Text(titles[5])),
      //   ],
      // ),
    ];
  }
}
