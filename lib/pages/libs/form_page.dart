import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blcs/common/utils/navigator.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String selectedStr = '';
List<String> options = ['选项1', '选项2', '选项3', '选项4'];
List<bool> status = [false, false, false, false];
String selectedStrAllFunctionDemo = '';
List<bool> statusAllFunctionDemo = [false, false, false, false];
List<String> list =['手机号','座机'];
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
        headerChild: Column(
          children: [
            commonButton(
                content: "BrnMultiChoicePortraitInputFormItem",
                des: "用于纵向多选录入",
                onTop: () {
                  NavigatorUtils.fadePush(context, BrnMultiChoicePortraitInputFormItemWidget.keys);
                }),
            BrnRangeInputFormItem(
              minController: TextEditingController()..text = "10",
              maxController: TextEditingController()..text = "100",
              title: "基本样式",
              hintMin: "最小范围",
              hintMax: "最大范围",
              minUnit: "天",
              maxUnit: "天",
              leftMaxCount: 1,
              rightMaxCount: 3,
              inputType: BrnInputType.number,
              onTip: () {
                BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onMinChanged: (newValue) {
                BrnToast.show("点击触发回调_${newValue}_onChanged", context);
              },
              onMaxChanged: (newValue) {
                BrnToast.show("点击触发回调_${newValue}_onChanged", context);
              },
            ),
            SizedBox(height: 10.r,),
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
                  },
                ),
                BrnTextBlockInputFormItem(
                  title: '备注',
                  hint: '请输入备注信息',
                  maxCharCount: 100,
                  onChanged: (String newStr) {
                  },
                ),
              ],
            ),
            SizedBox(height: 10.r,),
            BrnRangeInputFormItem(
              minController: TextEditingController()..text = "100",
              maxController: TextEditingController()..text = "100",
              prefixIconType: BrnPrefixIconType.add,
              isRequire: true,
              error: "必填项不能为空",
              title: "全功能",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              isEdit: true,
              hintMin: "最小范围",
              hintMax: "最大范围",
              minUnit: "天",
              maxUnit: "天",
              leftMaxCount: 1,
              rightMaxCount: 3,
              inputType: BrnInputType.number,
              onTip: () {
                BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onMinChanged: (newValue) {
                BrnToast.show("点击触发回调_${newValue}_onChanged", context);
              },
              onMaxChanged: (newValue) {
                BrnToast.show("点击触发回调_${newValue}_onChanged", context);
              },
            ),
            SizedBox(height: 10.r,),
            BrnExpandFormGroup(
              title: "展开收起分组",
              isExpand: false,
              children: [
                BrnTextInputFormItem(
                  title: "示例子项1",
                  hint: "请输入",
                  onChanged: (newValue) {
                    BrnToast.show("点击触发回调_${newValue}_onChanged", context);
                  },
                ),
                BrnTextInputFormItem(
                  title: "示例子项2",
                  hint: "请输入",
                  onChanged: (newValue) {
                    BrnToast.show("点击触发回调_${newValue}_onChanged", context);
                  },
                ),
                BrnTextInputFormItem(
                  title: "示例子项3",
                  hint: "请输入",
                  onChanged: (newValue) {
                    BrnToast.show("点击触发回调_${newValue}_onChanged", context);
                  },
                ),
              ],
            ),
            SizedBox(height: 10,),
            //全功能样式
            BrnExpandFormGroup(
              title: "展开收起分组",
              subTitle: "这里是副标题",
              deleteLabel: "删除",
              tipLabel: "标签",
              error: "必填项不能为空",
              isRequire: true,
              isEdit: true,
              onRemoveTap: () {
                BrnToast.show("点击触发回调_onRemoveTap", context);
              },
              children: [
                BrnTextInputFormItem(
                  title: "示例子项1",
                  hint: "请输入",
                  onChanged: (newValue) {
                    BrnToast.show("点击触发回调_${newValue}_onChanged", context);
                  },
                ),
                BrnTextInputFormItem(
                  title: "示例子项2",
                  hint: "请输入",
                  onChanged: (newValue) {
                    BrnToast.show("点击触发回调_${newValue}_onChanged", context);
                  },
                ),
                BrnTextInputFormItem(
                  title: "示例子项3",
                  hint: "请输入",
                  onChanged: (newValue) {
                    BrnToast.show("点击触发回调_${newValue}_onChanged", context);
                  },
                ),
              ],
            ),
            SizedBox(height: 10,),
            ///用于评星类型输入
            BrnStarsFormItem(
              title: "基本样式",
              sumStar: 5,
              value: 2,
              onTip: () {
                BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (oldValue, newValue) {
                BrnToast.show("点击触发回调${oldValue}_${newValue}_onChanged", context);
              },
            ),
            SizedBox(height: 10,),
            BrnStarsFormItem(
              prefixIconType: BrnPrefixIconType.add,
              isRequire: true,
              isEdit: true,
              error: "必填项不能为空",
              title: "全样式",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              sumStar: 5,
              value: 2,
              onTip: () {
                BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (oldValue, newValue) {
                BrnToast.show("点击触发回调${oldValue}_${newValue}_onChanged", context);
              },
            ),
            SizedBox(height: 10,),
            ///用于开关类型输入
            BrnStepInputFormItem(
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              value: 3,
              maxLimit: 5,
              minLimit: 1,
              onTip: () {
                BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (oldValue, newValue) {
                BrnToast.show("点击触发回调${oldValue}_${newValue}_onChanged", context);
              },
            ),
            SizedBox(height: 10,),
            BrnStepInputFormItem(
              prefixIconType: BrnPrefixIconType.add,
              isRequire: true,
              isEdit: true,
              error: "必填项不能为空",
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              value: 2,
              maxLimit: 5,
              minLimit: 1,
              onTip: () {
                BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (oldValue, newValue) {
                BrnToast.show("点击触发回调${oldValue}_${newValue}_onChanged", context);
              },
            ),
            SizedBox(height: 10,),
            ///文本选择
            BrnTextQuickSelectFormItem(
              title: "证件类型",
              btnsTxt: options,
              value: selectedStr,
              // selectBtnList: status,
              isBtnsScroll: true,
              onBtnSelectChanged: (int index) {
                status[index] = !status[index];
                if (status[index]) {
                  selectedStr += '${options[index]} ';
                } else if (selectedStr.contains(options[index])) {
                  selectedStr = selectedStr.replaceFirst('${options[index]} ', '');
                }
                BrnToast.show(
                    "点击触发onBtnSelectChanged回调。\n index:$index",
                    context);
              },
              onTip: () {
                BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onTap: () {
                BrnToast.show("点击触发回调_onTap", context);
              },
            ),
            SizedBox(height: 10,),
            BrnTextQuickSelectFormItem(
              prefixIconType: BrnPrefixIconType.add,
              isRequire: true,
              btnsTxt: options,
              selectBtnList: statusAllFunctionDemo,
              value: selectedStrAllFunctionDemo,
              isBtnsScroll: true,
              error: "必填项不能为空",
              title: "证件类型",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              onBtnSelectChanged: (index) {
                statusAllFunctionDemo[index] = !statusAllFunctionDemo[index];
                if (statusAllFunctionDemo[index]) {
                  selectedStrAllFunctionDemo += '${options[index]} ';
                } else if (selectedStrAllFunctionDemo.contains(options[index])) {
                  selectedStrAllFunctionDemo = selectedStrAllFunctionDemo.replaceFirst('${options[index]} ', '');
                }
                BrnToast.show(
                    "点击触发onBtnSelectChanged回调。\n index:$index",
                    context);
                /// 需要配合 statefulwidget 使用
                // setState(() {});
              },
              onTip: () {
                BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onTap: () {
                BrnToast.show("点击触发回调_onTap", context);
              },
            ),
            SizedBox(height: 10,),
            BrnTitleSelectInputFormItem(
              title: list[0],
              hint: "请输入",
              // controller: controller,
              inputFormatters: [FilteringTextInputFormatter(RegExp('[0-9"]'), allow: true)],
              selectedIndex: -1,
              selectList: list,
              onTip: () {
                BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (newValue) {
                BrnToast.show("点击触发回调_${newValue}_onChanged", context);
              },
              onTitleSelected: (String title, int index) {
                // if ('座机' == title && controller.text.length > 5) {
                //   BrnToast.show('输入长度不符合要求', context);
                //   controller.text = '111***1111';
                // }
              },
            ),
            SizedBox(height: 10,),
            BrnTitleSelectInputFormItem(
              controller: TextEditingController()..text = "124",
              prefixIconType: BrnPrefixIconType.add,
              isRequire: true,
              isEdit: false,
              error: "必填项不能为空",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              title: list[0],
              hint: "请输入",
              selectedIndex: -1,
              selectList: list,
              onTip: () {
                BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (newValue) {
                BrnToast.show("点击触发回调_${newValue}_onChanged", context);
              },
              onTitleSelected: (String title, int index) {
                BrnToast.show("点击触发回调_${title}_${index}_onChanged", context);
              },
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
}

///https://bruno.ke.com/page/widgets/brn-multi-choice-portrait-input-form-item
class BrnMultiChoicePortraitInputFormItemWidget extends StatelessWidget {
  static const keys = 'BrnMultiChoicePortraitInputFormItemWidget';
  const BrnMultiChoicePortraitInputFormItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: 'BrnMultiChoicePortraitInputFormItemWidget',
      keys: FormPage.keys,
      logoColor: Theme.of(context).primaryColor,
      headerChild: Column(
        children: [
          BrnMultiChoicePortraitInputFormItem(
            title: "自然到访保护期",
            options: [
              "固定",
              "永久",
              "未知",
            ],
            value: [
              "固定",
              "永久",
            ],
            onTip: () {
              BrnToast.show("点击触发onTip回调", context);
            },
            onAddTap: () {
              BrnToast.show("点击触发onAddTap回调", context);
            },
            onRemoveTap: () {
              BrnToast.show("点击触发onRemoveTap回调", context);
            },
            onChanged: (List<String> oldValue, List<String> newValue) {
              BrnToast.show(
                  "点击触发onChanged回调${oldValue.length}_${newValue.length}_onChanged", context);
            },
          ),
          SizedBox(height: 10,),
          BrnMultiChoicePortraitInputFormItem(
            prefixIconType: BrnPrefixIconType.remove,
            isRequire: true,
            error: "必填项不能为空",
            title: "自然到访保护期",
            subTitle: "这里是副标题",
            tipLabel: "标签",
            options: [
              "固定",
              "永久",
              "未知",
            ],
            value: [
              "固定",
              "永久",
            ],
            enableList: [true, true, false],
            onTip: () {
              BrnToast.show("点击触发onTip回调", context);
            },
            onAddTap: () {
              BrnToast.show("点击触发onAddTap回调", context);
            },
            onRemoveTap: () {
              BrnToast.show("点击触发onRemoveTap回调", context);
            },
            onChanged: (List<String> oldValue, List<String> newValue) {
              BrnToast.show(
                  "点击触发onChanged回调${oldValue.length}_${newValue.length}_onChanged", context);
            },
          )
        ],
      ),
    );
  }
}

