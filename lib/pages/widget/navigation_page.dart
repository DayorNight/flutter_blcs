import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/navigator.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/pages/widget/list/app_bar_page.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'tabs_page.dart';

class NavigationPage extends StatefulWidget {
  static final String keys = "NavigationPage";

  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  var actionKey = GlobalKey();

  int currentIndex = 0;

  var selectedHeiStyle = TextStyle(color:Colors.white);
  var unSelectedHeiStyle = TextStyle(color:Colors.grey);
  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: '导航',
      keys: NavigationPage.keys,
      logoColor: Theme.of(context).primaryColor,
      headerChild: Column(
        children: [
          commonButton(content: "Appbar", des: "普通导航栏:左侧+标题+右侧",onTop: ()=> {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AppBarDemo1();
            }))
          }),
          commonButton(content: "Appbar", des: "普通导航栏:左侧+标题+右侧+tabs",onTop: ()=> {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AppBarDemo2();
            }))
          }),
          commonButton(content: "自定义导航", des: "左侧+标题+右侧"),
          SizedBox(height: 10.w,),
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios,color: Colors.white,),
                Text("自定义导航",style:TextStyle(color: Colors.white),),
                Text("设置",style:TextStyle(color: Colors.white),),
              ],
            ),
          ),
          SizedBox(height: 10.r,),
          BrnAppBar(
        brightness: Brightness.dark,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "标题名称",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Icon(Icons.expand_circle_down),
            )
          ],
        ),
      ),
          SizedBox(height: 10.r,),
          BrnAppBar(
            //自定义左侧icon
            leading: Icon(Icons.search),
            brightness: Brightness.dark,
            //文本title
            title: '标题名称',
          ),
          SizedBox(height: 10.r,),
          BrnAppBar(
            //默认显示返回按钮
            automaticallyImplyLeading: true,
            brightness: Brightness.dark,
            title: '名称名称',
            //自定义的右侧文本
            actions: BrnTextAction(
              '文本按钮',
            ),
          ),
          SizedBox(height: 10.r,),
          BrnAppBar(
        title: '标题名称',
        brightness: Brightness.dark,
        leading: BrnDoubleLeading(
          first: BrnBackLeading(child: Icon(Icons.arrow_back_ios_new_rounded),),
          second: BrnBackLeading(
            child: Icon(Icons.clear),
          ),
        ),
        actions: BrnTextAction(
          '弹出菜单',
          key: actionKey,
          iconPressed: () {
            BrnPopupListWindow.showPopListWindow(context, actionKey,
                offset: 10, data: ["买卖买卖", "租赁租"]);
          },
        ),
      ),
          SizedBox(height: 10.r,),
      BrnAppBar(
        brightness: Brightness.dark,
        //自定义leading
        leading: Icon(Icons.arrow_back_ios_rounded),
        //自定义title
        title: Container(
          height: 44,
          padding: EdgeInsets.only(left: 24,right: 12),
          child: ListView.separated(
            itemCount: 10,
            //横滑
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    this.currentIndex = index;
                  });
                },
                child: Center(
                  child: Text(
                    index == 2 ?'标题' : '标题多文字',
                    style: index == currentIndex
                        ? selectedHeiStyle
                        : unSelectedHeiStyle,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 24,
              );
            },
          ),
        ),
        actions: IconButton(onPressed: (){}, icon: Icon(Icons.add)),
      ),
        ],
      ),

    );
  }


}
