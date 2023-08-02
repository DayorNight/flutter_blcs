import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_widget.dart';
import 'package:flutter_blcs/common/utils/code.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapterPage extends BasePageWidget {
  static final String keys = "screenAdapterView";

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.screenAdapter;

  @override
  String? get getDes => screenAdapterDes;

  @override
  String? get getCode => screenAdapterCode;

 @override
  Widget? buildFooterBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        printTxt("屏幕宽度大小：${MediaQuery.of(context).size.width}"),
        printTxt("屏幕高度大小：${MediaQuery.of(context).size.height}"),
        printTxt("Flutter大小100的正方形："),
        Container(width: 100,height: 100, color: Colors.black,),
        printTxt("大小100.w的正方形："),
        Container(width: 100.w,height: 100.w, color: Colors.blue,),
        printTxt("大小50.r的正方形："),
        Container(width: 100.r,height: 100.r, color: Colors.indigo,),
        printTxt("大小0.5.sw的正方形："),
        Container(width: 0.5.sw,height: 0.5.sw, color: Colors.deepPurpleAccent,),
        Text("Flutter字体大小30",style: TextStyle(fontSize: 30)),
        Text("适配字体大小30.sp",style: TextStyle(fontSize: 30.sp)),
      ],
    );
  }
}
