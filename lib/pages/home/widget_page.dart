import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/navigator.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/pages/pages.dart';
import 'package:flutter_blcs/widgets/flare_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// UI 列表
class WidgetPage extends StatefulWidget {
  const WidgetPage({Key? key}) : super(key: key);

  @override
  _WidgetPageState createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  var banners = ["Flutter", "Kotlin", "Android"];
  final List _hotWeiget = [
    "弹窗",
    "进度条",
    "图表",
    "Scaffold",
    "Scaffold",
    "Scaffold",
    "Scaffold",
    "Scaffold"
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: getBanner(banners),
          ),

          ///中间列表
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
                itemBuilder: _horWidget,
                itemCount: _hotWeiget.length,
                shrinkWrap: true,
              ),
            ),
          ),

          ///底部列表
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(_loadList,
                  childCount: _hotWeiget.length),
              itemExtent: 70),
        ],
      ),
    );
  }

  ///水平列表item
  Widget _horWidget(context, index) {
    return GestureDetector(
      onTap: (){
        NavigatorUtils.fadePush(context, horWidget[_hotWeiget[index]]);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlareLogo(size: 90.r,color: Colors.white,),
            Text(
              _hotWeiget[index],
              style: TextStyle(color: Colors.white,fontSize: 30.sp),
            )
          ],
        ),
      ),
    );
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
          SizedBox(height: 16.w),
          Text(
            _hotWeiget[index],
            style: TextStyle(color: Colors.white,fontSize: 30.sp),
          )
        ],
      ),
    );
  }

  /// 加载list
  Widget? _loadList(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _hotWeiget[index],
            style: TextStyle(fontSize:30.sp, color: Colors.white),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
          )
        ],
      ),
    );
  }

}
