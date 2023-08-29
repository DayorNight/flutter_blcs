import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_state_widget.dart';
import 'package:getwidget/components/tabs/gf_segment_tabs.dart';
import 'package:getwidget/components/tabs/gf_tabbar.dart';
import 'package:getwidget/components/tabs/gf_tabbar_view.dart';
import 'package:getwidget/components/tabs/gf_tabs.dart';

class GFTabBarPage extends BasePageStateWidget{
  static const keys = 'GFTabBarPage';

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => 'GFTabBar';
  @override
  Widget? buildBody(BuildContext context) {
    return ListView(
      children: [
        GFTabBar(
          length: 3,
          controller: tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.directions_bike),
              child: Text(
                "Tab1",
              ),
            ),
            Tab(
              icon: Icon(Icons.directions_bus),
              child: Text(
                "Tab2",
              ),
            ),
            Tab(
              icon: Icon(Icons.directions_railway),
              child: Text(
                "Tab3",
              ),
            ),
          ],
        ),

        GFTabBarView(
          height: 300,
            controller: tabController,
            children: <Widget>[
              Container(color: Colors.red,height: 300,),
              Container(color: Colors.green,height: 300,),
              Container(color: Colors.blue,height: 300,)
            ]
        ),

        SizedBox(height: 10,),
        GFTabs(
          length: 3,
          controller: tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.directions_bike),
              child: Text(
                "Tab1",
              ),
            ),
            Tab(
              icon: Icon(Icons.directions_bus),
              child: Text(
                "Tab2",
              ),
            ),
            Tab(
              icon: Icon(Icons.directions_railway),
              child: Text(
                "Tab3",
              ),
            ),
          ],
          tabBarView: GFTabBarView(
            controller: tabController,
            children: <Widget>[
              Container(child: Icon(Icons.directions_bike), color: Colors.red,),
              Container(child: Icon(Icons.directions_bus), color: Colors.blue,),
              Container(child: Icon(Icons.directions_railway), color: Colors.orange,),
            ],
          ),
        ),
        SizedBox(height: 10,),
        GFSegmentTabs(
          tabController: tabController,
          length: 3,
          tabs: <Widget>[
            Text(
              "Tab1",
            ),
            Text(
              "Tab2",
            ),
            Text(
              "Tab3",
            ),
          ],
        ),
      ],
    );
  }

  late TabController tabController;

  @override
  void initStateTicker(TickerProvider vsync) {
    super.initStateTicker(vsync);
    tabController = TabController(length: 3, vsync: vsync);
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}