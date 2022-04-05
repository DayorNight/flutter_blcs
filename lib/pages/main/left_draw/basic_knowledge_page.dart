import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/flare_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/l10n.dart';

class BasicKnowledgePage extends StatelessWidget {
  static final String keys = "BasicKnowledgePage";

  const BasicKnowledgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, S
          .of(context)
          .basicKnowledge),
      body: ListView.separated(itemBuilder: _itemBuilder,
          separatorBuilder: (context, index) => Divider(height: 24.r,),
          itemCount: 10),
    );
  }

  Widget _itemBuilder(ctx, index) {
    var primaryColor = Theme
        .of(ctx)
        .primaryColor;
    return Padding(padding: EdgeInsets.only(left: 20.r, right: 20.r),
        child:Row(
          children: [
            FlareLogo(size: 70.r, color: primaryColor),
            Text('xxxxx',style: TextStyle(fontSize: 60.sp,color: primaryColor),),
            Spacer(),
            Icon(Icons.arrow_forward_ios_rounded,color: primaryColor,)
          ],
        ),
    );
  }

}
