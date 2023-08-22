import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_state_widget.dart';
import 'package:flutter_blcs/common/utils/navigator.dart';
import 'package:flutter_blcs/generated/assets.dart';
import 'package:flutter_blcs/pages/my/personal_information_page.dart';
import 'package:flutter_blcs/pages/my/personal_page.dart';
import 'package:flutter_blcs/routes/pages.dart';
import 'package:flutter_blcs/widgets/flare_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MePage extends BasePageStateWidget {
  final String _tag = 'PersonalView';
  final String _name = '登录';
  final String _avator = '头像';
  final String _signature = '个性签名：看那高楼平地起 愿有岁月可回头';

  @override
  Widget buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
              left: 25.r, top: 200.r, right: 25.r, bottom: 70.r),
          sliver: SliverToBoxAdapter(
              child: GestureDetector(
            onTap: () {
              NavigatorUtils.fadePush(context, PersonalInformationPage.keys);
            },
            child: buildPersonalInformation(context),
          )),
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

  ///头像信息
  Container buildPersonalInformation(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Container(
        height: 150.r,
        child: Row(children: [
          Hero(
              tag: _tag,
              child: ClipOval(
                child: GestureDetector(
                    onTap: () {
                      NavigatorUtils.fadePush(context, PersonalPage.keys,
                          arguments: _avator);
                    },
                    child: Image.asset(
                      Assets.imagesIcAvator,
                      width: 150.r,
                      height: 150.r,
                    )),
              )),
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
                    fontSize: 40.sp,
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
                  style: TextStyle(fontSize: 30.sp, color: primaryColor),
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
        ]));
  }

  /// 加载list
  Widget? _loadList(BuildContext context, int index) {
    Color primaryColor = Theme.of(context).primaryColor;
    var tag = myPages.values.elementAt(index);
    return GestureDetector(
      onTap: () {
        NavigatorUtils.fadePush(context, tag);
      },
      child: Container(
        padding: EdgeInsets.only(left: 25.r, right: 25.r),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 1.r))),
        child: Row(
          children: [
            Hero(tag: tag, child: FlareLogo(size: 80.r, color: primaryColor)),
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
