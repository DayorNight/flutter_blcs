import 'package:flutter/material.dart';
import 'package:flutter_blcs/bean/draw_list.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/utils/function_util.dart';
import 'package:flutter_blcs/pages/home/function_view.dart';
import 'package:flutter_blcs/pages/home/me_view.dart';
import 'package:flutter_blcs/pages/home/widget_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///首页
class MainView extends StatefulWidget {
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
    //屏幕适配
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(750, 1334),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);

    initData();
    return WillPopScope(
        child: Scaffold(
          ///防止键盘遮挡
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
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
                  accountName: Text("blcs"),
                  accountEmail: Text("xxxxxx@xxx.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/ic_avator.png"),
                  ),
                  otherAccountsPictures: <Widget>[
                    //其他账号头像
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
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
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Setting'),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    print("Setting");
                  },
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
    Navigator.of(context).pushNamed('demoView');
  }

  /// draw list ui
  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: Icon(_datas[index].icon),
      title: Text(_datas[index].title),
      trailing: Icon(_datas[index].trailing),
      onTap: () {
        var title = _datas[index].title;
        if (title == _s.switch_theme) {
          Navigator.of(context).pushNamed('themeView');
        } else if (title == _s.switch_language) {
          Navigator.of(context).pushNamed('languageView');
        }
      },
    );
  }

  //draw 列表 数据
  void initData() async {
    var datas = <DrawListBean>[];
    var themeSelect =
        DrawListBean(Icons.ac_unit, _s.switch_theme, Icons.arrow_forward_sharp);
    var languageSelect = DrawListBean(
        Icons.language_rounded, _s.switch_language, Icons.arrow_forward_sharp);
    var drawListBean =
        DrawListBean(Icons.message, 'message', Icons.arrow_forward_sharp);
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
