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
          )
        ],
      ),
    );
  }


}
