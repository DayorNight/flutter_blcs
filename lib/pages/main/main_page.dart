import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/static.dart';
import 'package:flutter_blcs/common/utils/function.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/pages/demo_page.dart';
import 'package:flutter_blcs/widgets/flare_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/utils/navigator.dart';
import 'main_config.dart';

///首页
class MainPage extends StatefulWidget {
  static final String keys = "mainView";

  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}
List<CameraDescription> cameras = [];
class _MainPageState extends State<MainPage> {
  late S _s;
  int _bottomIndex = 0;
  var _title;

  var _menu;
  var _name = '登录';
  var _email = 'xxxxxxxxxxxxx@xxx.com';
  var _imgPath =
      'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2491682377,1019940373&fm=26&gp=0.jpg';


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _s = S.of(context);
    _menu = [_s.homeView, _s.homeFun, _s.homeMe];
    _title = _menu[_bottomIndex];
  }

  @override
  Widget build(BuildContext context) {
    screenInit(context);
    return WillPopScope(
        child: Scaffold(
          ///防止键盘遮挡
          resizeToAvoidBottomInset: false,
          appBar: _bottomIndex == 2
              ? null
              : AppBar(
                  title: Text(_title),
                  centerTitle: true,
                  actions: [
                    IconButton(onPressed: _theme, icon: Icon(Icons.settings))
                  ],
                ),
          body: getPageView(_bottomIndex),

          ///左侧抽屉
          drawer: leftDrawer(context),

          ///左侧抽屉是否支持手势滑动
          drawerEnableOpenDragGesture: true,

          ///底部导航栏
          bottomNavigationBar: getBottomNavigationBar(),

          ///悬浮按钮
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.red,
            onPressed: () {
              print("add");
            },
          ),

          ///悬浮动画
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        ),

        ///拦截返回 双击退出
        onWillPop: () async {
          return isDoubleClick();
        });
  }

  Drawer leftDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            //用户信息栏
            accountName: Text(
              _name,
              style: TextStyle(fontSize: 38.sp),
            ),
            accountEmail: Text(_email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(Images.logo),
            ),
            otherAccountsPictures: <Widget>[
              //其他账号头像
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.exit_to_app_rounded))
            ],
            onDetailsPressed: () {},
            //下拉箭头
            decoration: BoxDecoration(
              //背景图片
              image: DecorationImage(
                  image: NetworkImage(_imgPath), fit: BoxFit.cover //图片不变性裁剪居中显示
                  ),
            ),
          ),
          ListView.builder(
            itemBuilder: _itemBuilder,
            itemCount: leftData.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  ///底部导航栏
  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
      items: bottomItems,
      currentIndex: _bottomIndex,
      onTap: (index) {
        print("index: $index");
        _title = _menu[index];
        setState(() {
          _bottomIndex = index;
        });
      },
    );
  }

  ///home page
  Widget getPageView(int index) {
    return IndexedStack(
      index: _bottomIndex,
      children: pages,
    );
  }

  /// 前往主题设置
  void _theme() async{
    cameras = await availableCameras();
    NavigatorUtils.fadePush(context, DemoPage.keys);
  }

  /// draw list ui
  Widget _itemBuilder(BuildContext context, int index) {
    var primaryColor = Theme.of(context).primaryColor;
    return ListTile(
      leading: FlareLogo(
        size: 60.r,
        color: primaryColor,
      ),
      title: Text(
        leftData.keys.elementAt(index),
        style: TextStyle(color: primaryColor),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: primaryColor,
      ),
      onTap: () {
        NavigatorUtils.fadePush(context, leftData.values.elementAt(index));
      },
    );
  }

}
