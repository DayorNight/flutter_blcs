import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_widget.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';

class BrnTagPage extends BasePageWidget {
  static const keys = 'BrnTagPage';

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.tag_title;

  @override
  Widget? buildHeaderBody(BuildContext context) {
    return Column(
      children: [
        commonButton(content: 'BrnSelectTag', des: '标签组件'),
        buildBrnSelectTag(context),
        commonButton(content: 'BrnDeleteTag', des: '可删除标签'),
        buildBrnDeleteTag(context),
        commonButton(content: 'BrnStateTag', des: '状态标签'),
        buildBrnStateTag(context),
        commonButton(content: 'BrnTagCustom', des: '自定义标签'),
        buildBrnTagCustom(context),
      ],
    );
  }

  buildBrnSelectTag(BuildContext context) {
    List<String> tagList = [
      '这是一条很长很长很长很长很长很长很长很长很长很长的标签',
      '标签信息',
      '标签信息标签信息',
      '标签信息',
      '标签信息标签信息标签信息标签信息'
    ];
    return Column(
      children: [
        Text('单选 Tag，标签等宽'),
        BrnSelectTag(
            tags: tagList,
            spacing: 12,
            tagWidth: _getTagWidth(context),
            initTagState: [true],
            onSelect: (selectedIndexes) {
              BrnToast.show(selectedIndexes.toString(), context);
            }),
        Text('多选 Tag，标签等宽'),
        BrnSelectTag(
            tags: tagList,
            spacing: 12,
            isSingleSelect: false,
            tagWidth: _getTagWidth(context),
            initTagState: [true],
            onSelect: (selectedIndexes) {
              BrnToast.show(selectedIndexes.toString(), context);
            }),
        Text('横向滑动，标签等宽'),
        BrnSelectTag(
            tags: tagList,
            tagWidth: _getTagWidth(context),
            softWrap: false,
            onSelect: (index) {
              BrnToast.show("$index is selected", context);
            }),
        Text('横向滑动的自适应宽度标签(最小宽度 75)'),
        BrnSelectTag(
            tags: tagList,
            tagWidth: _getTagWidth(context),
            softWrap: false, /// 设置单行展示
            fixWidthMode: false, /// 设置非等宽
            onSelect: (index) {
              BrnToast.show("$index is selected", context);
            }),
        Text('流式布局，自适应宽度标签'),
        BrnSelectTag(
            tags: [
              '标签',
              '选中标签',
              '未选中标签',
              '标签圆角、字号、色值、高度都可主题配置',
              '组件可设置固定宽度还是流式布局',
              '主题定制可配置最小宽度，现在限制的最小宽度是110'
            ],
            isSingleSelect: false,
            fixWidthMode: false,
            spacing: 12,
            onSelect: (selectedIndexes) {
              BrnToast.show(selectedIndexes.toString(), context);
            }
        ),
      ],
    );
  }

  double _getTagWidth(context, {int rowCount : 4}) {
    double leftRightPadding = 40;
    double rowItemSpace = 12;
    return MediaQuery.of(context).size.width - leftRightPadding - rowItemSpace * (rowCount - 1) / rowCount;
  }

  buildBrnDeleteTag(BuildContext context) {
    return Column(
      children: [
        Text('默认样式'),
        BrnDeleteTag(
          controller: controller,
          onTagDelete: (tags, tag, index) {
            BrnToast.show('剩余的标签为：${tags.toString()},删除了的标签为：$tag  ,删除的标签index为$index', context);
          },
        ),
        Text('自定义标签样式、删除 icon Size'),
        BrnDeleteTag(
          controller: controller,
          tagTextStyle: TextStyle(color: Colors.blue, fontSize: 20),
          deleteIconSize: Size(16, 16),
          onTagDelete: (tags, tag, index) {
            BrnToast.show('剩余的标签为：${tags.toString()},删除了的标签为：$tag  ,删除的标签index为$index', context);
          },
        ),

      ],
    );
  }
  final BrnDeleteTagController controller = BrnDeleteTagController(initTags: [
    '这是一条很长很长很长很长很长很长很长很长很长很长的标签',
    '标签信息',
    '标签信息标签信息',
    '标签信息',
    '标签信息标签信息标签信息标签信息'
  ]);

  buildBrnStateTag(BuildContext context) {
    return Column(
      children: [
        BrnStateTag(
          tagText: '成功态',
          tagState: TagState.succeed,
        ),
        BrnStateTag(
          tagText: '失败态',
          tagState: TagState.failed,
        )
      ],
    );
  }

  buildBrnTagCustom(BuildContext context) {
    return Column(
      children: [
        BrnTagCustom(
          tagText: "自定义",
        ),
        BrnTagCustom(
          tagText: '自定义标签',
          backgroundColor: Colors.green,
          tagBorderRadius: BorderRadius.only(bottomLeft: Radius.circular(5)),
        ),
        BrnTagCustom.buildBorderTag(
          tagText: '认证通过',
          textColor: Colors.red,
          borderColor: Colors.red,
          borderWidth: 2,
          fontSize: 24,
          textPadding: EdgeInsets.all(6),
        )
      ],
    );
  }

}
