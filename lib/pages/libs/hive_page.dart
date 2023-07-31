import 'package:flutter/material.dart';
import 'package:flutter_blcs/bean/person.dart';
import 'package:flutter_blcs/common/base_page_state_widget.dart';
import 'package:flutter_blcs/common/utils/hive_utils.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';

class HivePage extends BasePageStateWidget {
  static const keys = 'HivePage';
  static const object_box = 'object_box';
  static const object_key = 'object_key';
  static const base_box = 'base_box';
  static const base_key = 'base_key';

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.hive_page_title;


  final ValueNotifier<String?> notifier = ValueNotifier(null);

  @override
  Widget? buildBody(BuildContext context) {
    return Column(
      children: [
        commonButton(
            content: 'put',
            des: '存储对象',
            onTop: () {
              var person = Person(
                name: 'Dave',
                age: 18,
              );
              HiveUtils.put<Person>(object_key, person, boxName: object_box,adapter: PersonAdapter());
              // person.save()//更新
              // person.delete()//删除
            }),

        commonButton(
            content: 'get',
            des: '获取对象',
            onTop: () async {
              var person = await HiveUtils.get<Person>(object_key, boxName: object_box);
              print("person ${person?.name}");
              notifier.value = person?.name;
            }),
        commonButton(
            content: 'put',
            des: '存储基本数据',
            onTop: () {
              HiveUtils.put(base_key, 3333,boxName:base_box);
            }),

        commonButton(
            content: 'get',
            des: '获取基本数据',
            onTop: () async {
              var value = await HiveUtils.get(base_key, boxName: base_box);
              print("value $value");
              notifier.value = value.toString();
            }),

        Center(
          child: ValueListenableBuilder(
            valueListenable: notifier,
            builder: (context,value,__) {
              return Text("value = $value");
            }
          ),
        )
      ],
    );
  }

  @override
  void initState() async{
     await HiveUtils().init();
  }
}
