import 'package:flutter/material.dart';
import 'package:flutter_blcs/bean/draw_list.dart';
import 'package:flutter_blcs/common/static.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/common/utils/function.dart';
import 'package:flutter_blcs/pages/config/setting_theme_view.dart';
import 'package:flutter_blcs/pages/config/switch_language_view.dart';
import 'package:flutter_blcs/pages/demo_view.dart';
import 'package:flutter_blcs/pages/home/function_view.dart';
import 'package:flutter_blcs/pages/home/me_view.dart';
import 'package:flutter_blcs/pages/home/widget_view.dart';
import 'package:flutter_blcs/widgets/flare_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/utils/navigator.dart';

///首页
class MainView extends StatefulWidget {
  static final String keys = "mainView";

  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late S _s;
  late List<DrawListBean> _datas;
  int _bottomIndex = 0;
  var _title ;
  var _menu;
  PageController _pageController = PageController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _s = S.of(context);
    _menu = [_s.home_view,_s.home_fun,_s.home_me];
    _title = _menu[_bottomIndex];
    print("_MainViewState $_title");
  }
  @override
  Widget build(BuildContext context) {
    screenInit(context);
    initData();
    return WillPopScope(
        child: Scaffold(
          ///防止键盘遮挡
          resizeToAvoidBottomInset: false,
          appBar: _bottomIndex==2?null:AppBar(
            title: Text(_title),
            centerTitle: true,
            actions: [
              IconButton(onPressed: _theme, icon: Icon(Icons.settings))
            ],
          ),
          body: getPageView(_bottomIndex),
          ///左侧抽屉
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  //用户信息栏
                  accountName: Text("登录",style: TextStyle(fontSize: 38.sp),),
                  accountEmail: Text("xxxxxxxxxxxxx@xxx.com"),
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
                        image: NetworkImage(
                            'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2491682377,1019940373&fm=26&gp=0.jpg'),
                        fit: BoxFit.cover //图片不变性裁剪居中显示
                        ),
                  ),
                ),
                ListView.builder(
                  itemBuilder: _itemBuilder,
                  itemCount: _datas.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),

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

  ///底部导航栏
  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded), label: _s.home_view),
        BottomNavigationBarItem(
            icon: Icon(Icons.widgets_rounded), label: _s.home_fun),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: _s.home_me),
      ],
      currentIndex: _bottomIndex,
      onTap: (index) {
        print("index: $index");
        _pageController.jumpToPage(index);
        setState(() {
          _bottomIndex = index;
        });
      },
    );
  }

  ///home page
  Widget getPageView(int index) {

    return PageView(
      controller: _pageController,
      children: [WidgetView(), FunctionView(), MeView()],
      onPageChanged: (index) {
        print("index $index");
        _title = _menu[index];
        setState(() {
          _bottomIndex = index;
        });
      },
    );
  }

  /// 前往主题设置
  void _theme() {
    NavigatorUtils.fadePush(context, DemoView.keys);
  }

  /// draw list ui
  Widget _itemBuilder(BuildContext context, int index) {
    var primaryColor = Theme.of(context).primaryColor;
    return ListTile(
      // leading: Icon(_datas[index].icon),
      leading: FlareLogo(size: 60.r,color: primaryColor,),
      title: Text(_datas[index].title,style: TextStyle(color: primaryColor),),
      trailing: Icon(_datas[index].trailing,color: primaryColor,),
      onTap: () {
        var title = _datas[index].title;
        if (title == _s.switch_theme) {
          NavigatorUtils.fadePush(context, SettingThemeView.keys);
        } else if (title == _s.switch_language) {
          NavigatorUtils.fadePush(context, SwitchLanguageView.keys);
        }
      },
    );
  }

  //draw 列表 数据
  void initData() async {
    var datas = <DrawListBean>[];
    var themeSelect =
        DrawListBean(Icons.ac_unit, _s.switch_theme, Icons.arrow_forward_ios_rounded);
    var languageSelect = DrawListBean(
        Icons.language_rounded, _s.switch_language, Icons.arrow_forward_ios_rounded);
    var drawListBean =
        DrawListBean(Icons.message, 'message', Icons.arrow_forward_ios_rounded);
    datas.add(themeSelect);
    datas.add(languageSelect);
    datas.add(drawListBean);
    setState(() {
      _datas = datas;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
