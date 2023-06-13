import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_blcs/widgets/custom_search_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectionPage extends StatefulWidget {
  static const keys = 'SelectionPage';
  const SelectionPage({Key? key}) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  final List<BrnSelectionEntity> _filterData = [
    BrnSelectionEntity(value: '111',title: '年龄',children: [ BrnSelectionEntity(value: "18",title: '18',isSelected: true,),BrnSelectionEntity(title: '30',)]),
    BrnSelectionEntity(value: '222',title: '性别',children: [ BrnSelectionEntity(value: "男",title: '男',isSelected: true,),BrnSelectionEntity(title: '女',)]),
    BrnSelectionEntity(value: '333',title: '爱好',children: [ BrnSelectionEntity(value: "唱歌",title: '唱歌',),BrnSelectionEntity(title: '阅读',isSelected: true,)]),
  ];
  final BrnFlatSelectionController controller = BrnFlatSelectionController();

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: S.current.selection_title,
      keys: SelectionPage.keys,
      logoColor: Theme.of(context).primaryColor,
      footerChild: ListView(
        shrinkWrap: true,
        children: [
          commonButton(content: 'BrnFlatSelection',des:'区间+输入混合一级筛选' ),
          BrnFlatSelection(
              entityDataList: _filterData,
              confirmCallback: (data) {
                print("object = $data");
                String str = '';
                data.forEach((k, v) => str=str +" "+'${k}: ${v}');
                BrnToast.show(str, context);
              },
              controller: controller),
          commonButton(content: 'BrnSelectionView',des:'筛选组件包括下面几种类型，可用在多种场景：列表筛选型，单列表筛选、双列表筛选、三列表筛选.标签筛选型，无 Tab 标签类型、多 Tab 标签类型 .时间筛选型，时间点选择，时间范围选择类型' ),
          BrnSelectionView(
              originalSelectionData: _filterData,
              onSelectionChanged: (int menuIndex,
                  Map<String, String> filterParams,
                  Map<String, String> customParams,
                  BrnSetCustomSelectionMenuTitle setCustomTitleFunction) {
                BrnToast.show(filterParams.toString(), context);
              }
          ),
          BrnSelectionView(
            originalSelectionData: _filterData,
            onSelectionChanged: (int menuIndex,
                Map<String, String> filterParams,
                Map<String, String> customParams,
                BrnSetCustomSelectionMenuTitle setCustomTitleFunction) {
              BrnToast.show(filterParams.toString(), context);
            },
            onSelectionPreShow: (int index, BrnSelectionEntity entity) {
              // if (entity.key == "one_range_key" || entity.key == "two_range_key") {
              //   return BrnSelectionWindowType.Range;
              // }
              // return entity.filterShowType;
              return BrnSelectionWindowType.range;
            },
          ),
          BrnSelectionView(
            originalSelectionData: _filterData,
            onMoreSelectionMenuClick: (int index, BrnOpenMorePage openMore) {
              /// 手动触发打开更多筛选页面
              openMore(updateData: false);
            },
            onSelectionChanged: (int menuIndex,
                Map<String, String> filterParams,
                Map<String, String> customParams,
                BrnSetCustomSelectionMenuTitle setCustomTitleFunction) {},
          ),BrnSelectionView(
            originalSelectionData: _filterData,
            onCustomSelectionMenuClick: (int index, BrnSelectionEntity customMenuItem,
                BrnSetCustomSelectionParams customHandleCallBack) {

            },
            onSelectionChanged: (int menuIndex,
                Map<String, String> filterParams,
                Map<String, String> customParams,
                BrnSetCustomSelectionMenuTitle setCustomTitleFunction) {
              if (menuIndex == 1 && setCustomTitleFunction != null) {
                // ③手动设置对应的 menu title 和是否高亮
                setCustomTitleFunction(
                    menuTitle:
                    BrunoTools.isEmpty(customParams) ? "" : customParams['CKey'] ?? "",
                    isMenuTitleHighLight: !BrunoTools.isEmpty(customParams['CKey']));
              }
            },
          ),
          BrnSelectionView(
            originalSelectionData: _filterData,
            onSelectionChanged: (int menuIndex,
                Map<String, String> filterParams,
                Map<String, String> customParams,
                BrnSetCustomSelectionMenuTitle setCustomTitleFunction) {
              BrnToast.show(filterParams.toString(), context);
            },
            onSelectionPreShow: (int index, BrnSelectionEntity entity) {
              return BrnSelectionWindowType.range;
            },
          ),
          commonButton(content: 'BrnSimpleSelection', des: '简单筛选列表，包含单选和多选两种示例，适合简单的业务场景。'),
          BrnSimpleSelection.radio(
            menuName: "标题",
            menuKey:  "标题",
            items: [
              ItemEntity(name: '标题0'),
              ItemEntity(name: '标题1'),
              ItemEntity(name: '标题2'),
            ],
            defaultValue:  "标题",
            onSimpleSelectionChanged: (
                List<ItemEntity> filterParams) {
              BrnToast.show(filterParams.map((e) => e.value).toList().join(','), context);
            },
          ),
        ],
      ),
    );
  }
}
