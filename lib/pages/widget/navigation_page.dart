import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/navigator.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

class NavigationPage extends StatefulWidget {
  static final String keys = "NavigationPage";

  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  // List<ItemEntity> lists = [
  //   ItemEntity(name: "顶部导航", value: "顶部导航"),
  //   ItemEntity(name: "底部导航", value: "底部导航"),
  //   // ItemEntity(value: ""),
  //   // ItemEntity(value: ""),
  // ];
  // String? _selection = "顶部导航";

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: '导航',
      keys: NavigationPage.keys,
      logoColor: Theme.of(context).primaryColor,
      // headerChild: BrnSimpleSelection.radio(
      //   menuName: lists[0].name,
      //   menuKey: lists[0].name,
      //   items: lists,
      //   defaultValue: lists[0].name,
      //   onSimpleSelectionChanged: (List<ItemEntity> filterParams) {
      //     _selection = filterParams.first.value;
      //   },
      // ),
      // footerChild: Column(
      //   children: _listWidget(context),
      // ),
    );
  }

  // _listWidget(BuildContext context) {
  //   print("_selection $_selection");
  //   switch (_selection) {
  //     case "顶部导航":
  //       return topBar(context);
  //     case "底部导航":
  //       return bottomBar(context);
  //   }
  // }
  //
  // ///顶部导航
  // topBar(BuildContext context) {
  //   return [
  //     commonButton(
  //         content: "TabBar + TabBarView",
  //         des: "导航栏",
  //         onTop: () => NavigatorUtils.toClass(context, TabBarDemo())),
  //   ];
  // }
}
