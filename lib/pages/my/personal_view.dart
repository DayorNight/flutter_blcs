import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/static.dart';
import '../../generated/l10n.dart';
/// 个人头像
class PersonalView extends StatelessWidget {
  static const String keys = 'personalView';
  const PersonalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).personal,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
          SizedBox(
            width: 15.r,
          )
        ],
      ),
      body: Hero(
        tag: 'PersonalView',
        child: Center(
          child: Image(
            image: AssetImage(Images.logo),
            width: 750.r,
            height: 750.r,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
