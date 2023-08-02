import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_widget.dart';
import 'package:flutter_blcs/common/utils/sp_utils.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';

import '../../common/utils/print.dart';

class SharedPreferencesPage extends BasePageWidget {
  static const keys = 'SharedPreferencesPage';

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.shared_preferences_title;

  final TextEditingController controller = TextEditingController();

  final ValueNotifier<String> notifier = ValueNotifier<String>("显示读取的数据");

  @override
  Widget buildHeaderBody(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      isCollapsed: true,
                        border: OutlineInputBorder(),
                      hintText: "请输入存储数据",
                      hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ),
                ),
              ),
              Expanded(
                child: commonButton(content: 'Write data', des: '写入', onTop: (){
                  var text = controller.text;
                  println.i(text);
                  SpUtils.put(keys, text);
                }),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ValueListenableBuilder<String>(
                    valueListenable: notifier,
                    builder: (_,value,__) {
                      return Center(child: Text(value));
                    }
                ),
              ),
              Expanded(
                child: commonButton(content: 'Read data', des: '读取',onTop: (){
                  final value = SpUtils.getString(keys);
                  notifier.value = value;
                }),
              ),
            ],
          ),
          commonButton(content: 'Remove data', des: '删除',onTop: (){
            SpUtils.remove(keys);
            // SpUtils.clear();
          })
        ],
      ),
    );
  }

}
