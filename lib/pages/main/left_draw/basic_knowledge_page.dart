import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/flare_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        builder: _builder,
        future: getBasicKnowledgeData(),
      ),
    );
  }

  Widget _builder(ctx, AsyncSnapshot<List<Knowledge>> snapshot) {
    var data = snapshot.data;
    if (data!=null) {
      return ListView.separated(
          itemBuilder: (ctx, index) {
            var primaryColor = Theme.of(ctx).primaryColor;
            return GestureDetector(
              onTap: () {
                showDialog(
                    context: ctx,
                    builder: (ctx) => SimpleDialog(
                          title: Align(
                            alignment: Alignment.center,
                            child: Text(
                              data[index].parse ?? "",
                              style: TextStyle(fontSize: 30.sp),
                            ),
                          ),
                          children: [
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(ctx);
                              },
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '确定',
                                  style: TextStyle(fontSize: 50.sp),
                                ),
                              ),
                            )
                          ],
                        ));
              },
              child: _itemUI(primaryColor, data, index),
            );
          },
          separatorBuilder: (context, index) => Divider(
                height: 24.r,
              ),
          itemCount: data.length);
    } else {
      return Center(child: Text(snapshot.error.toString()));
    }
  }
  //item 布局
  Padding _itemUI(Color primaryColor, List<Knowledge> data, int index) {
    return Padding(
              padding: EdgeInsets.only(left: 20.r, right: 20.r),
              child: Row(
                children: [
                  FlareLogo(size: 70.r, color: primaryColor),
                  Container(
                    width: 0.78.sw,
                    child: Text(
                      data[index].issue ?? "",
                      style: TextStyle(fontSize: 30.sp, color: primaryColor,),
                    ),
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
