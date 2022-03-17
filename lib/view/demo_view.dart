import 'package:flutter/material.dart';
import 'package:flutter_blcs/global/global_theme.dart';
import 'package:flutter_blcs/utils/weiget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class  DemoView extends StatefulWidget {
  const DemoView({Key? key}) : super(key: key);

  @override
  _DemoViewState createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView> {
    @override
  Widget build(BuildContext context) {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;
      print("width= $width");
      print("height= $height");
    return Scaffold(
      appBar: getAppBar("Demo"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 50,
            color: themes[5],
          ),
          Container(
            width: 100,
            height: 50,
            color: themes[0],
          ),
          Container(
            width: 200,
            height: 50,
            color: themes[1],
          ),
          Container(
            width: 300,
            height: 50,
            color: themes[2],
          ),
          Container(
            width: 350,
            height: 50,
            color: themes[3],
          ),
          Container(
            width: 360,
            height: 50,
            color: themes[5],
          ),
          Container(
            width: 400,
            height: 50,
            color: themes[4],
          ),
          Container(
            width: 750.w,
            height: 50.h,
            color: themes[4],
          ),

          Container(
            child: Row(
              children: [
                Container(
                  width: 180,
                  height: 50,
                  color: themes[1],
                ),
                Container(
                  width: 180,
                  height: 50,
                  color: themes[2],
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  width: 180.w,
                  height: 50.w,
                  color: themes[1],
                ),
                Container(
                  width: 180.w,
                  height: 50.h,
                  color: themes[2],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
