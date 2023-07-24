import 'package:flutter/material.dart';
import 'package:flutter_blcs/bean/person.dart';
import 'package:flutter_blcs/common/base_page_state_widget.dart';
import 'package:flutter_blcs/common/utils/hive_utils.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';

class HivePage extends BasePageStateWidget {
  static const keys = 'FormPage';
  static const Box = 'box_name';

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.hive_page_title;

  var age = 11;

  final ValueNotifier<int?> ages = ValueNotifier(-1);

  @override
  Widget? buildBody(BuildContext context) {
    return Column(
      children: [
        commonButton(
            content: 'put',
            des: '存储',
            onTop: () {
              var person = Person(
                name: 'Dave',
                age: age,
                friends: ['Linda', 'Marc', 'Anne'],
              );
              HiveUtils.put<Person>('Person', person);
              age++;
            }),
        commonButton(
            content: 'get',
            des: '获取',
            onTop: () async {
              var future = await HiveUtils.get<Person>('Person');
              ages.value = future?.age;
            }),
        Center(
          child: ValueListenableBuilder(
            valueListenable: ages,
            builder: (context,value,__) {
              return Text("age = $value");
            }
          ),
        )
      ],
    );
  }

  @override
  void initState() {

  }
}
