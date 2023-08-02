import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_widget.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/utils/print.dart';

class PullRefreshPage extends BasePageWidget {
  static const keys = 'PullRefreshPage';

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.pull_refresh_titile;
  final List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

  final Map<String, Widget> headers = {
    "CustomHeader": CustomHeader(builder: (context, mode) {
      println.i("===mode $mode ===");
      Widget body;
      if (mode == LoadStatus.idle) {
        body = Text("下拉刷新");
      } else if (mode == LoadStatus.loading) {
        body = CupertinoActivityIndicator();
      } else if (mode == LoadStatus.failed) {
        body = Text("刷新失败！点击重试！");
      } else if (mode == LoadStatus.canLoading) {
        body = Text("刷新中");
      } else {
        body = Text("没有更多数据了!");
      }
      return Container(
        height: 55.0,
        child: Center(child: body),
      );
    }),
    "BezierHeader": BezierHeader(),
    "BezierCircleHeader": BezierCircleHeader(),
    "ClassicHeader": ClassicHeader(),
    "LinkHeader": LinkHeader(
      linkKey: GlobalKey(),
    ),
    "MaterialClassicHeader": MaterialClassicHeader(),
    "WaterDropMaterialHeader": WaterDropMaterialHeader(),
    "TwoLevelHeader": TwoLevelHeader(),
    "WaterDropHeader": WaterDropHeader(),
  };

  final Map<String, Widget> footers = {
    "CustomFooter": CustomFooter(builder: (context, mode) {
      println.i("===mode $mode ===");
      Widget body;
      if (mode == LoadStatus.idle) {
        body = Text("上拉加载");
      } else if (mode == LoadStatus.loading) {
        body = CupertinoActivityIndicator();
      } else if (mode == LoadStatus.failed) {
        body = Text("加载失败！点击重试！");
      } else if (mode == LoadStatus.canLoading) {
        body = Text("加载中");
      } else {
        body = Text("没有更多数据了!");
      }
      return Container(
        height: 55.0,
        child: Center(child: body),
      );
    }),
    "ClassicFooter": ClassicFooter(),
    "LinkFooter": LinkFooter(
      linkKey: GlobalKey(),
    ),
  };

  final RefreshController _controller = RefreshController();

  @override
  Widget buildBody(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => ClassicHeader(),
      // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
      footerBuilder: () => ClassicFooter(),
      // 配置默认底部指示器
      headerTriggerDistance: 80.0,
      // 头部触发刷新的越界距离
      springDescription:
      SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
      // 自定义回弹动画,三个属性值意义请查询flutter api
      maxOverScrollExtent: 100,
      //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
      maxUnderScrollExtent: 0,
      // 底部最大可以拖动的范围
      enableScrollWhenRefreshCompleted: true,
      //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
      enableLoadingWhenFailed: true,
      //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
      hideFooterWhenNotFull: true,
      // Viewport不满一屏时,禁用上拉加载更多功能
      enableBallisticLoad: true,
      // 可以通过惯性滑动触发加载更多
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _controller,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        // header: WaterDropHeader(),
        // footer: ClassicFooter()??buildCustomFooter(),
        child: _buildListView(),
      ),
    );
  }
  ///刷新
  void _onRefresh() async {
    println.i("===刷新===");
    // _controller.loadComplete();
    await Future.delayed(Duration(milliseconds: 3000));
    _controller.refreshCompleted();
  }

  ///加载
  void _onLoading() async {
    println.i("===加载===");
    await Future.delayed(Duration(milliseconds: 3000));
    items.add((items.length + 1).toString());
    // if(mounted)
    //   setState(() {
    //
    //   });
    _controller.loadComplete();
  }

  /// listView
  _buildListView() {
    return ListView.builder(
      shrinkWrap: false,
      itemBuilder: (context, index) => Card(
        child: Center(
          child: Text(items[index]),
        ),
      ),
      itemExtent: 100,
      itemCount: items.length,
    );
  }
}
