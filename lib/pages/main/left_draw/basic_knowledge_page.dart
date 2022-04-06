import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/flare_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../bean/knowledge.dart';
import '../../../generated/l10n.dart';
import '../../../models/basic_knowledge_model.dart';

class BasicKnowledgePage extends StatelessWidget {
  static final String keys = "BasicKnowledgePage";

  const BasicKnowledgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, S.of(context).basicKnowledge),
      body: FutureBuilder<List<Knowledge>>(
        builder: (ctx, AsyncSnapshot<List<Knowledge>> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (ctx, index) {
                  var primaryColor = Theme.of(ctx).primaryColor;
                  return Padding(
                    padding: EdgeInsets.only(left: 20.r, right: 20.r),
                    child: Row(
                      children: [
                        FlareLogo(size: 70.r, color: primaryColor),
                        Text(
                          snapshot.data![index].issue!,
                          style: TextStyle(fontSize: 40.sp, color: primaryColor),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: primaryColor,
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 24.r,
                ),
                itemCount: 10);
          }else{
            return Center(child: Text(snapshot.error.toString()));
          }
        },
        future: getBasicKnowledgeData(),
      ),
    );
  }
}
