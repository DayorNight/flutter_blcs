import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_blcs/common/static.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeView extends StatefulWidget {
  const MeView({Key? key}) : super(key: key);

  @override
  _MeViewState createState() => _MeViewState();
}

class _MeViewState extends State<MeView> {
  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Container(
                height: 220.w,
                color: Colors.grey,
                margin: EdgeInsets.only(top: 50),
                child: Row(children: [
                  ClipOval(
                    child: Image.asset(
                      Images.logo,
                      width: 200.w,
                      height: 200.w,
                    ),
                  ),
                  SizedBox(width: 20.w,),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text(
                        '登录',
                        style: TextStyle(fontSize: 60.sp, color: primaryColor,fontWeight: FontWeight.bold),
                      ),
                      // Spacer(),
                      Text(
                        '个性签名：',
                        style: TextStyle(fontSize: 40.sp, color: primaryColor),
                      ),
                    ],
                  )
                ]))),
      ],
    );
  }
}
