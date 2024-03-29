import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_widget.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/generated/l10n.dart';
///https://bruno.ke.com/page/widgets/brn-input-text
class InputPage extends BasePageWidget {
  static const keys = 'InputPage';

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.input_title;

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("输入框初始高度可配,根据输入内容动态算高:"),
        SizedBox(height: 10,),
        BrnInputText(
          maxHeight: 200,
          minHeight: 30,
          minLines: 1,
          maxLength: 1000,
          bgColor: Colors.grey[200]!,
          textString: "请输入文本" ?? '',
          textInputAction: TextInputAction.newline,
          maxHintLines: 20,
          hint: 'input动态算高input动态算高input动态算高input动态算高input动态算高',
          padding: EdgeInsets.fromLTRB(20, 10, 20, 14),
          onTextChange: (text) {
            println.i(text);
            // model.text = text;
            // setState(() {});
          },
          onSubmit: (text) {
            print(text);
          },
        ),
      ],
    );
  }
}
