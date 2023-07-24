import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_widget.dart';
import 'package:flutter_blcs/common/utils/navigator.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';

class CitySelectionPage extends BasePageWidget {
  static const keys = 'CitySelectionPage';

  @override
  Widget buildBody(BuildContext context) {
    List<BrnSelectCityModel> hotCityList = [];
    hotCityList.addAll([
      BrnSelectCityModel(name: "北京市"),
      BrnSelectCityModel(name: "广州市"),
      BrnSelectCityModel(name: "成都市"),
      BrnSelectCityModel(name: "深圳市"),
      BrnSelectCityModel(name: "杭州市"),
      BrnSelectCityModel(name: "武汉市"),
    ]);
    return Column(
      children: [
        commonButton(content: 'BrnSingleSelectCityPage', des: '用于城市选择的单选页面，可以自定制导航栏文案，搜索文案信息，定位信息，右侧可快速滑动查看城市',onTop: (){
          NavigatorUtils.toClass(context, BrnSingleSelectCityPage(
            appBarTitle: '城市单选',
            hotCityTitle: '这里是推荐城市',
            hotCityList: hotCityList,
            onValueChanged: (value){
              BrnToast.show(value.name, context);
            },
          ));
        }),
      ],
    );
  }

  @override
  String? get getKeys => keys;


  @override
  String? get getTitle => S.current.city_selection_title;

}
