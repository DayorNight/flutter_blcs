import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/navigator.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormPage extends StatelessWidget {
  static const keys = 'FormPage';

  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArticleModel(
        title: S.current.form_title,
        keys: FormPage.keys,
        logoColor: Theme.of(context).primaryColor,
        headerChild: commonButton(
            content: "BrnExpandableGroup",
            des: "可展开收起的表单项组类型",
            onTop: () {
              NavigatorUtils.fadePush(context, BrnExpandableGroupWidget.keys);
            }),
      ),
    );
  }
}

class BrnExpandableGroupWidget extends StatefulWidget {
  static const keys = 'BrnExpandableGroupWidget';

  const BrnExpandableGroupWidget({Key? key}) : super(key: key);

  @override
  State<BrnExpandableGroupWidget> createState() =>
      _BrnExpandableGroupWidgetState();
}

class _BrnExpandableGroupWidgetState extends State<BrnExpandableGroupWidget> {
  List<String> selectedOptions = [];
  BrnPortraitRadioGroupOption? selectedValue;
  String? commentStr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArticleModel(
        title: 'BrnExpandableGroupWidget',
        keys: FormPage.keys,
        logoColor: Theme.of(context).primaryColor,
        headerChild: Column(
          children: [
            SizedBox(
              height: 200.r,
            ),
            BrnExpandableGroup(
              title: "标题",
              children: [
                BrnTextBlockInputFormItem(
                  title: '备注',
                  hint: '请输入备注信息',
                  maxCharCount: 100,
                  onChanged: (String newStr) {
                  },
                ),
              ],
            ),
            SizedBox(height: 10,),
            BrnExpandableGroup(
              title: "标题2",
              subtitle: "副标题",
              // backgroundColor: Colors.indigo,
              initiallyExpanded:true,
              themeData: BrnFormItemConfig(
                backgroundColor: Colors.white
              ),
              onExpansionChanged: (value){
                println.i('value= $value');
              },
              children: [
                BrnPortraitRadioGroup.withSimpleList(
                  options: ['测试1', '测试2'],
                  // selectedOption: selectedValue?.title ?? "测试1",
                  onChanged: (oldStr, newStr) {
                    BrnToast.show(newStr?.title ?? "测试1", context);
                    selectedValue = newStr;
                    commentStr = '';
                    setState(() {});
                  },
                ),
                BrnTextBlockInputFormItem(
                  title: '备注',
                  hint: '请输入备注信息',
                  maxCharCount: 100,
                  onChanged: (String newStr) {
                    commentStr = newStr;
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
