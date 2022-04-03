import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_blcs/common/static.dart';
import 'package:flutter_blcs/pages/my/personal_view.dart';
import 'package:flutter_blcs/pages/pages.dart';
import 'package:flutter_blcs/widgets/flare_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../my/personal_information_view.dart';

class MeView extends StatefulWidget {
  const MeView({Key? key}) : super(key: key);

  @override
  _MeViewState createState() => _MeViewState();
}

class _MeViewState extends State<MeView> {
  Color primaryColor = Colors.grey;
  String _name = '登录';
  String _signature = '个性签名：看那高楼平地起 愿有岁月可回头';

  @override
  Widget build(BuildContext context) {
    primaryColor = Theme.of(context).primaryColor;
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
              left: 25.r, top: 200.r, right: 25.r, bottom: 70.r),
          sliver: SliverToBoxAdapter(
              child: Container(
                  height: 170.r,
                  child: Row(children: [
                    ClipOval(
                      child: Image.asset(
                        Images.logo,
                        width: 150.r,
                        height: 150.r,
                      ),
                    ),
                    SizedBox(
                      width: 20.r,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          _name,
                          style: TextStyle(
                              fontSize: 50.sp,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          width: 0.5.sw,
                          child: Text(
                            _signature,
                            softWrap: true,
                            maxLines: 2,
                            style:
                                TextStyle(fontSize: 30.sp, color: primaryColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.qr_code_2,
                      color: primaryColor,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: primaryColor,
                    ),
                  ]))),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.grey.shade300,
            height: 20.r,
          ),
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(_loadList,
                childCount: myPages.length),
            itemExtent: 60),
      ],
    );
  }

  /// 加载list
  Widget? _loadList(BuildContext context, int index) {
    var tag = myPages.values.elementAt(index);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(tag);
      },
      child: Container(
        padding: EdgeInsets.only(left: 25.r, right: 25.r),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 1.r))),
        child: Row(
          children: [
            Hero(tag: tag, child: FlareLogo(size: 80.r,color: primaryColor)),
            Text(
              myPages.keys.elementAt(index),
              style: TextStyle(
                  fontSize: 45.sp, color: primaryColor, height: 2.2.r),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: primaryColor,
              size: 40.r,
            )
          ],
        ),
      ),
    );
  }
}
