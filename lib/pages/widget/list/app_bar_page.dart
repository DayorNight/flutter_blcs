import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String appBarCode =
'''AppBar(
  {
    Key? key,
    // 通常情况下返回一个返回键
    Widget? leading,
    // 左侧leading的宽度，默认56	
    double? leadingWidth,
    // 和leading配合使用，如果为true并且leading为空的情况下，会自动配置返回键
    // false 隐藏默认配置的返回键
    bool automaticallyImplyLeading = true,
    // 导航栏的标题
    Widget? title,
    // 一个右侧Widget列表
    List<Widget>? actions,
    // 堆叠在工具栏和选项卡栏的后面
    Widget? flexibleSpace,
    // 出现在导航栏底部的控件
    PreferredSizeWidget? bottom,
    // 控制导航栏下方阴影的大小
    double? elevation,
    double? scrolledUnderElevation,
    ScrollNotificationPredicate notificationPredicate = defaultScrollNotificationPredicate,
    // 控制导航栏下方阴影的颜色
    Color? shadowColor,
    Color? surfaceTintColor,
    // 导航栏的形状以及阴影
    ShapeBorder? shape,
    // 导航栏的背景颜色
    Color? backgroundColor,
    // 导航栏中文本和图标的颜色
    Color? foregroundColor,
    // 导航栏图标的颜色、透明度、大小的配
    IconThemeData? iconTheme,
    // 导航栏右侧图标的颜色、透明度、大小的配置
    IconThemeData? actionsIconTheme,
    // 导航栏是否显示在屏幕顶部
    bool primary = true,
    // 标题是否居中，不同操作系统默认显示位置不一样
    bool? centerTitle,
    // 标题是否应该用 [Semantics] 包裹，默认false
    bool excludeHeaderSemantics = false,
    // title内容的间距
    double? titleSpacing,
    // 导航栏的透明度
    double toolbarOpacity = 1.0,
    // 导航栏底部的透明度
    double bottomOpacity = 1.0,
    // 导航栏的高度，默认kToolbarHeight
    double? toolbarHeight,
    // 导航栏图标的颜色
    TextStyle? toolbarTextStyle,
    // 导航栏标题的默认颜色
    TextStyle? titleTextStyle,
    // 叠加层的样式
    SystemUiOverlayStyle? systemOverlayStyle
    }
)
''';
class AppBarPage extends StatelessWidget {
  static final String keys = "AppBarPage";
  const AppBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: 'AppBar',
      keys: keys,
      logoColor: Theme.of(context).primaryColor,
      des: "AppBar是基于Material Design设计风格的应用栏，一般使用在Scaffold内部，作为顶部导航栏",
      code: appBarCode,
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
        ],
      ),
    );
  }
}

class AppBarDemo2 extends StatefulWidget {

  const AppBarDemo2({Key? key}) : super(key: key);

  @override
  State<AppBarDemo2> createState() => _AppBarDemo2State();
}

class _AppBarDemo2State extends State<AppBarDemo2> with TickerProviderStateMixin{
  late TabController _tabBarController;
  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(length: 2, vsync: this,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        bottom: TabBar(
          controller: _tabBarController,
          tabs: [
            Tab(text: "火车", icon: Icon(Icons.bus_alert),),
            Tab(text: "汽车", icon: Icon(Icons.bus_alert),)
          ],
        ),
      ),
    );
  }
}


class AppBarDemo1 extends StatefulWidget {

  const AppBarDemo1({Key? key}) : super(key: key);

  @override
  State<AppBarDemo1> createState() => _AppBarDemo1State();
}

class _AppBarDemo1State extends State<AppBarDemo1> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         // 修改返回键
         // leading: Icon(Icons.add_circle),
         // 返回键距左边距离
         leadingWidth: 100.w,
         // 和leading配合使用，如果为true并且leading为空的情况下，会自动配置返回键
         // false 隐藏默认配置的返回键
         // automaticallyImplyLeading: true,
         // 标题
         title: Text("AppBar"),
         // 位置是否居中
         centerTitle: true,
         //右侧 按钮
         actions: [
           Center(
             child:  Text("设置"),
           ),
           SizedBox(width: 20.w,),
           Center(
             child:  Text("分享"),
           ),
           SizedBox(width: 20.w,),
         ],
         // ///控制应用栏下方阴影的大小，这个值不能是一个负值
         // elevation: 10,
         // ///控制导航栏下方阴影的颜色
         // shadowColor: Colors.green,
         // ///导航栏的形状以及阴影
         // shape: RoundedRectangleBorder(
         //     side: BorderSide(
         //         color: Colors.red,
         //         width: 5
         //     )
         // ),
         // ///导航栏的背景颜色
         // backgroundColor: Colors.orange,
         // ///导航栏中文本和图标的颜色
         // foregroundColor: Colors.black,
         // ///与foregroundColor配合使用
         // backwardsCompatibility: true,
         // ///导航栏图标的颜色、透明度、大小的配置
         // iconTheme: IconThemeData(
         //     color: Colors.orange,
         //     opacity: 1,
         //     size: 50
         // ),
         // ///导航栏右侧图标的颜色、透明度、大小的配置
         // actionsIconTheme: IconThemeData(
         //   color: Colors.purple,
         // ),
         // ///导航栏是否显示在屏幕顶部
         // primary: true,
         // ///标题是否应该用 [Semantics] 包裹，默认false
         // excludeHeaderSemantics: true,
         // ///标题内容的间距，如果为0，将占用全部空间
         // titleSpacing: 0,
         // ///导航栏的透明度
         // toolbarOpacity: 0.5,
         // ///导航栏底部的透明度
         // bottomOpacity: 0.5,
         // ///导航栏的高度，默认kToolbarHeight
         // toolbarHeight: 200,
         // ///导航栏图标的颜色
         // toolbarTextStyle: TextStyle(
         //     color: Colors.black
         // ),
         // ///导航栏标题的默认颜色
         // titleTextStyle: TextStyle(
         //     color: Colors.red
         // ),

       ),
    );
  }
}

