import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/static.dart';
import '../../generated/l10n.dart';

//个人信息
class PersonalInformationPage extends StatefulWidget {
  static const String keys = 'personalInformationView';

  const PersonalInformationPage({Key? key}) : super(key: key);

  @override
  _PersonalInformationPageState createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  List<String> datas = [];

  @override
  void initState() {
    super.initState();
    datas.add('头像');
    datas.add('名字');
    datas.add('性别');
    datas.add('地区');
    datas.add('二维码');
    datas.add('个性签名');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, S.of(context).personalInformation),
      body:ListView.separated(itemBuilder: _item, separatorBuilder: (context,index)=>Divider(height: 24.r,), itemCount: datas.length)
    );
  }

  Widget _item(context, index) {
    var primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: Row(
        children: [
          Text(
            datas[index],
            style: TextStyle(fontSize: 40.r, color: primaryColor),
          ),
          Spacer(),
          // Image.asset(Images.logo,width: 150.r,height: 150.r,),
          SizedBox(
            width: 10.sp,
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: primaryColor,
          )
        ],
      ),
    );
  }
}
