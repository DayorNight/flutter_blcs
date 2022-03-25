import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';

/// UI 列表
class WidgetView extends StatefulWidget {
  const WidgetView({Key? key}) : super(key: key);

  @override
  _WidgetViewState createState() => _WidgetViewState();
}

class _WidgetViewState extends State<WidgetView> {
  var banners = ["Flutter", "Kotlin", "Android"];
  final List _horWeiget = [
    "Scaffold",
    "Scaffold",
    "Scaffold",
    "Scaffold",
    "Scaffold",
    "Scaffold",
    "Scaffold",
    "Scaffold"
  ];

  /// 加载list
  Widget? _loadList(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(left:10,right:10,bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _horWeiget[index],
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: getBanner(banners),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.0, //显示区域宽高相等
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.build_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(height: 6),
                        Text(
                          _horWeiget[index],
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  );
                },
                itemCount: _horWeiget.length,
                shrinkWrap: true,
              ),
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(_loadList,
                  childCount: _horWeiget.length),
              itemExtent: 70)
        ],
      ),
    );
  }
}
