import 'dart:convert';

import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blcs/bean/expend_multi_select_bottom_picker_item.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/common_edit_bottom_dialog.dart';

listBottomMenu(BuildContext context) {
  return [
    commonButton(
        content: "showModalBottomSheet",
        des: "显示一个底部弹出列表",
        onTop: () {
          _showModalBottomSheet(context);
        }),
    commonButton(
        content: "BrnCommonActionSheet",
        des: "底部弹出选项列表",
        onTop: () {
          _brnCommonActionSheet(context);
        }),
    commonButton(
        content: "BrnShareActionSheet",
        des: "底部弹出分享菜单",
        onTop: () {
          _brnShareActionSheet(context);
        }),
    commonButton(
        content: "BrnEditActionSheet",
        des: "底部弹出编辑框",
        onTop: () {
          CommonEditBottomDialog(
            onConfirmCallBack: (value) => {},
            onCancelCallBack: () => {},
            title: "标题",
          ).show(context);
        }),
    commonButton(
        content: "BrnBottomPicker",
        des: "自定义的从底部弹出的 picker 框，支持高度的自定义（内容、头部）。解决了 picker 中有输入框，键盘遮挡等问题",
        onTop: () {
          BrnBottomPicker.show(context,
              barrierDismissible: false,
              contentWidget: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '键盘抬起，不遮挡picker',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: '请输入'),
                  )
                ],
              ));
        }),
    commonButton(
        content: "BrnBottomWritePicker",
        des: "从底部弹出带输入框的 Picker",
        onTop: () {
          BrnBottomWritePicker.show(
            context,
            title: '写跟进',
            hintText: '请输入',
            confirmDismiss: true,
            onConfirm: (context, string) {
              // return;
            },
            onCancel: (_) {},
            defaultText: '',
          );
        }),
    commonButton(
        content: "BrnDatePicker",
        des: "适用于时间范围选择的情况",
        onTop: () {
          String format = 'yyyy年-MM月-dd日-HH时-mm分-ss秒';
          String MIN_DATETIME = '2020-01-01 00:00:00';
          String MAX_DATETIME = '2022-12-31 23:59:59';
          BrnDatePicker.showDatePicker(context,
              maxDateTime: DateTime.parse(MAX_DATETIME),
              minDateTime: DateTime.parse(MIN_DATETIME),
              initialDateTime: DateTime.parse('2021-06-20 18:26:59'),
              // 支持DateTimePickerMode.date、DateTimePickerMode.datetime、DateTimePickerMode.time
              pickerMode: BrnDateTimePickerMode.datetime,
              minuteDivider: 1,
              pickerTitleConfig: BrnPickerTitleConfig.Default,
              dateFormat: format, onConfirm: (dateTime, list) {
            BrnToast.show("onConfirm:  $dateTime   $list", context);
          }, onClose: () {
            print("onClose");
          }, onCancel: () {
            print("onCancel");
          }, onChange: (dateTime, list) {
            print("onChange:  $dateTime    $list");
          });
        }),
    commonButton(
        content: "BrnDateRangePicker",
        des: "适用于时间范围选择的情况",
        onTop: () {
          // String format = BrnIntl.of(context).localizedResource.dateFormate_yyyy_MM_dd;
          String format = 'yyyy年-MM月-dd日';
          String MIN_DATETIME = '2021-01-01 00:00:00';
          String MAX_DATETIME = '2021-12-31 23:59:59';
          BrnPickerTitleConfig pickerTitleConfig =
              BrnPickerTitleConfig(titleContent: "选择时间范围");
          //初始化：BrnLocalizationDelegate.delegate,
          BrnDateRangePicker.showDatePicker(context,
              isDismissible: false,
              minDateTime: DateTime.parse(MIN_DATETIME),
              maxDateTime: DateTime.parse(MAX_DATETIME),
              pickerMode: BrnDateTimeRangePickerMode.date,
              pickerTitleConfig: pickerTitleConfig,
              dateFormat: format,
              initialStartDateTime: DateTime(2021, 06, 21, 11, 00, 00),
              initialEndDateTime: DateTime(2021, 06, 23, 10, 00, 00),
              onConfirm: (startDateTime, endDateTime, startlist, endlist) {
            BrnToast.show(
                "onConfirm:  $startDateTime   $endDateTime     $startlist     $endlist",
                context);
          }, onClose: () {
            print("onClose");
          }, onCancel: () {
            print("onCancel");
          }, onChange: (startDateTime, endDateTime, startlist, endlist) {
            BrnToast.show(
                "onChange:  $startDateTime   $endDateTime     $startlist     $endlist",
                context);
          });
        }),
    commonButton(
        content: 'BrnMultiDataPicker',
        des: '适用于单列或者多列数据选择的情况,滚动选择组件',
        onTop: () {
          BrnMultiDataPicker(
            context: context,
            title: '来源',
            delegate: Brn1RowDelegate(firstSelectedIndex: 1),
            confirmClick: (list) {
              BrnToast.show(list.toString(), context);
            },
          ).show();
        }),
    commonButton(
        content: 'BrnMultiDataPicker',
        des: '二级联动',
        onTop: () {
          BrnMultiDataPicker(
            context: context,
            title: '委托来源',
            delegate:
                Brn2RowDelegate(firstSelectedIndex: 1, secondSelectedIndex: 0),
            confirmClick: (list) {
              BrnToast.show(list.toString(), context);
            },
          ).show();
        }),
    commonButton(
        content: 'BrnMultiColumnPicker',
        des: '用于页面底部的级联选择器',
        onTop: () {
          rootBundle
              .loadString('static/assets/multi_colum_picker.json')
              .then((data) {
            List<BrnPickerEntity> _selectionData = []..addAll(
                (JsonDecoder().convert(data)["data"]['list'] as List ?? [])
                    .map((o) => BrnPickerEntity.fromMap(o)));
            if (_selectionData.length > 0) {
              // _selectionData.forEach((f) => f.configRelationshipAndDefaultValue());
              // if (dataList.length == 0) {
              //   dataList.addAll(_selectionData);
              // }
              showRangePicker(context, _selectionData);
            }
          });
        }),
    commonButton(
        content: 'BrnMultiSelectListPicker',
        des: '多选底部弹框 ，适用于从页面底部弹出，存在多选列表的情况',
        onTop: () {
          List<ExpendMultiSelectBottomPickerItem> items = [];
          items.add(new ExpendMultiSelectBottomPickerItem("100", "这里是标题1",attribute1: "第一条自定义参数1"));
          items.add(new ExpendMultiSelectBottomPickerItem("101", "这里是标题2",attribute1: "第二条自定义参数2"));
          items.add(new ExpendMultiSelectBottomPickerItem("102", "这里是标题3", isChecked: true,attribute1: "第三条自定义参数3"));
          items.add(new ExpendMultiSelectBottomPickerItem("103", "这里是标题4", isChecked: true));
          items.add(new ExpendMultiSelectBottomPickerItem("104", "这里是标题5"));
          items.add(new ExpendMultiSelectBottomPickerItem("104", "这里是标题6"));
          BrnMultiSelectListPicker.show<ExpendMultiSelectBottomPickerItem>(
            context,
            items: items,
            pickerTitleConfig: BrnPickerTitleConfig(titleContent: "多选 Picker"),
            onSubmit: (List<ExpendMultiSelectBottomPickerItem> data) {
              var str = "";
              data.forEach((item) {
                String attribute = item.attribute1 ?? ""; //处理自定义字段
                str = str + attribute;
              });
              BrnToast.show(str, context);
              Navigator.of(context).pop();
            },
          );
        }),
    commonButton(
        content: 'BrnMultiSelectTagsPicker',
        des: '适用于底部弹出 Picker，且选择样式为 Tag 的场景。',
        onTop: () {
          _showMulSelectTagPicker(context);
        }),
    commonButton(
        content: 'BrnSelectTagsWithInputPicker',
        des: '可作为当操作“驳回/无效”等场景时用来填写原因的简单录入',
        onTop: () {
          List tags = [
            '我',
            '我是可选择',
            '我是可选择的标签',
            '我是文案特别长独自占一行的样式哦',
            '我是可选择的标签1',
            '我是可选择的标签1',
            '我是可选择的标签1',
          ];

          List<BrnTagInputItemBean> items = [];
          for (int i = 0; i < tags.length; i++) {
            String it = tags[i];
            BrnTagInputItemBean item = BrnTagInputItemBean(name: it, index: i, needExpend: (i % 2 == 0));
            items.add(item);
          }

          showDialog(
              context: context,
              builder: (_) => BrnSelectTagsWithInputPicker(
                title: '这里是标题文字',
                hintText: '请输入',
                confirm: (context, selectedTags, string) {
                  Navigator.of(context).pop();
                  return;
                },
                defaultText: "",
                tagPickerConfig: BrnTagsInputPickerConfig(
                  tagItemSource: items,
                  tagTitleFontSize: 12,
                  tagTitleColor: Color(0xFF222222),
                  tagBackgroundColor: Color(0xffF8F8F8),
                  selectedTagBackgroundColor: Color(0x140984F9),
                  selectedTagTitleColor: Color(0xFF0984F9),
                ),
                onTagValueGetter: (choice) {
                  return choice.name;
                },
              ));
        }),
    commonButton(
        content: 'BrnAppraiseBottomPicker',
        des: ' Picker 样式展现的评价组件',
        onTop: () {
          List<String> tags = [
            '我',
            '我是可选择',
            '我是可选择的标签',
            '我是文案特别长独自占一行的样式哦',
            '我是可选择的标签1',
            '我是可选择的标签1',
            '我是可选择的标签1',
          ];
          showDialog(
              context: context,
              builder: (context) {
                return BrnAppraiseBottomPicker(
                  title: "这里是标题文字",
                  tags: tags,
                  inputHintText: '这里是文本输入的组件',
                  onConfirm: (index, list, input) {
                    Navigator.pop(context);
                  },
                  config: BrnAppraiseConfig(
                      showConfirmButton: true,
                      count: 5,
                      starAppraiseHint: '星星未选择时的文案',
                      inputTextChangeCallback: (input) {
                        BrnToast.show('输入的内容为' + input, context);
                      },
                      iconClickCallback: (index) {
                        BrnToast.show('选中的评价为$index', context);
                      },
                      tagSelectCallback: (list) {
                        BrnToast.show(
                            '选中的标签为:' + list.toString(), context);
                      }),
                );
              });
        }),
  ];
}

///标签选择弹框
void _showMulSelectTagPicker(BuildContext context) {
  List tags = [
    '洗衣机',
    '电视机',
    '电冰箱',
    '双人床',
    '电茶炉',
    '洗手池222',
    '电茶炉333',
    '洗手池3311',
    '洗碗机',
    '挖掘111122机',
    '抽风机',
    '可爱多',
  ];

  List <BrnTagItemBean>items = [];
  for (int i = 0; i < tags.length ;i++){
    String it = tags[i];
    BrnTagItemBean item = BrnTagItemBean(name: it,code: it,index: i, isSelect: true);
    items.add(item);
  }

  BrnMultiSelectTagsPicker(
    context: context,

    //排列样式 默认 平均分配排序
    layoutStyle: BrnMultiSelectTagsLayoutStyle.average,

    //一行多少个 默认4个
    crossAxisCount: 4,

    //最大选中数目 - 不设置 或者设置为0 则可以全选
    maxSelectItemCount: 5,
    onItemClick: (BrnTagItemBean onTapTag, bool isSelect) {
      BrnToast.show(onTapTag.toString(), context);
    },
    onMaxSelectClick: () {
      BrnToast.show('最大数值不能超过5个', context);
    },
    pickerTitleConfig: BrnPickerTitleConfig(
      titleContent: '多选标题',
    ),
    tagPickerConfig: BrnTagsPickerConfig(
      tagItemSource: items,
      tagTitleFontSize: 12,
      chipPadding: EdgeInsets.only(left: 5, right: 5),
      tagTitleColor: Color(0xFF666666),
      tagBackgroudColor: Color(0xffF8F8F8),
      selectedTagBackgroudColor: Color(0x140984F9),
      selectedTagTitleColor: Color(0xFF0984F9),
    ),
    onConfirm: (value) {
      BrnToast.show(value.toString(), context);
    },
    onCancel: () {
      BrnToast.show('点击了取消按钮', context);
    },
    onTagValueGetter: (choice) {
      return choice.name;
    },
  ).show();
}

/// 弹出 Picker
void showRangePicker(
    BuildContext context, List<BrnPickerEntity> _selectionData) {
  _selectionData?.forEach((f) => f.configChild());
  var selectionMenuView = BrnMultiColumnPicker(
    entity: _selectionData[3],
    defaultFocusedIndexes: [0, 0, 0],
    onConfirm: (result, firstIndex,secondIndex,thirdIndex) {
      List<String> pickResult = [];
      result.forEach((key, val) {
        List<String> tmp = [];
        val.forEach((item) {
          tmp.add(item.name);
        });
        pickResult.add(tmp.toString());
      });
      BrnToast.show(pickResult.toString(), context);
    },
    onEntityTap: (int columnIndex, int rowIndex, BrnPickerEntity entity) {
      BrnToast.show('$columnIndex + $rowIndex + ${entity.name}', context);
    },
  );
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext dialogContext) {
      return selectionMenuView;
    },
  );
}

Future<void> _brnShareActionSheet(BuildContext context) async {
  List<BrnShareItem> firstRowList = [];
  List<BrnShareItem> secondRowList = [];
  firstRowList.add(BrnShareItem(
    BrnShareItemConstants.shareQZone,
    canClick: true,
  ));
  firstRowList.add(BrnShareItem(
    BrnShareItemConstants.shareSaveImage,
    canClick: true,
  ));
  firstRowList.add(BrnShareItem(
    BrnShareItemConstants.shareSms,
    canClick: true,
  ));
  firstRowList.add(BrnShareItem(
    BrnShareItemConstants.shareWeiBo,
    canClick: true,
  ));
  secondRowList.add(BrnShareItem(
    BrnShareItemConstants.shareQZone,
    canClick: false,
  ));
  secondRowList.add(BrnShareItem(
    BrnShareItemConstants.shareSaveImage,
    canClick: false,
  ));
  secondRowList.add(BrnShareItem(
    BrnShareItemConstants.shareSms,
    canClick: false,
  ));
  secondRowList.add(BrnShareItem(
    BrnShareItemConstants.shareWeiBo,
    canClick: false,
  ));
  BrnShareActionSheet actionSheet = new BrnShareActionSheet(
    firstShareChannels: firstRowList,
    secondShareChannels: secondRowList,
    clickCallBack: (int section, int index, BrnShareItem shareItem) {
      int channel = shareItem.shareType;
      BrnToast.show(
          "channel: $channel, section: $section, index: $index", context);
    },
    clickInterceptor: (int section, int index, BrnShareItem shareItem) {
      if (shareItem.canClick) {
        return false;
      } else {
        BrnToast.show("不可点击，拦截了", context);
        return true;
      }
    },
  );
  actionSheet.show(context);
}

/// https://bruno.ke.com/page/v2.2.0/widgets/brn-common-action-sheet
Future<void> _brnCommonActionSheet(BuildContext context) async {
  List<BrnCommonActionSheetItem> actions = [];
  actions.add(
    BrnCommonActionSheetItem(
      '选项一: 自定义主标题样式',
      desc: '辅助信息默认样式',
      titleStyle: TextStyle(
        fontSize: 18,
        color: Color(0xFF123984),
      ),
    ),
  );
  actions.add(
    BrnCommonActionSheetItem(
      '选项二: 自定义辅助信息样式',
      desc: '自定义辅助信息样式',
      descStyle: TextStyle(
        fontSize: 14,
        color: Color(0xFF129834),
      ),
    ),
  );
  actions.add(
    BrnCommonActionSheetItem(
      '选项三: 自定义拦截点击事件，点击无效',
      desc: '辅助信息',
      titleStyle: TextStyle(
        fontSize: 16,
        color: Color(0xFF999999),
      ),
      descStyle: TextStyle(
        fontSize: 14,
        color: Color(0xFF999999),
      ),
    ),
  );

// 展示actionSheet
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return BrnCommonActionSheet(
          title: "自定义点击拦截事件，选项三点击不反回，其他选项点击事件正常，并且自定义标题最大行数为3行，超出会截断会截断会截断",
          actions: actions,
          maxTitleLines: 3,
          clickCallBack: (
            int index,
            BrnCommonActionSheetItem actionEle,
          ) {
            String title = actionEle.title;
            BrnToast.show("title: $title, index: $index", context);
          },
          onItemClickInterceptor: (
            int index,
            BrnCommonActionSheetItem actionEle,
          ) {
            // 选项三点击事件被拦截，不作处理
            if (index == 2) {
              BrnToast.show("被拦截了", context);
              return true;
            }
            // 其他选项正常
            return false;
          },
        );
      });
}

/// 显示一个底部列表
Future<void> _showModalBottomSheet(BuildContext context) async {
  showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () => Navigator.of(context).pop(index),
          );
        },
      );
    },
  );
}

List<Map<String, List>> list = [
  {
    'AAA': [
      {
        'AAA': ['8', '9']
      },
      {
        'BBB': ['8', '9']
      },
      {
        'CCC': ['8', '9']
      }
    ]
  },
  {
    'BBB': [
      {
        'AAA': ['8', '9']
      },
      {
        'BBB': ['8', '9']
      },
      {
        'CCC': ['8', '9']
      }
    ]
  },
  {
    'CCC': [
      {
        'AAA': ['8', '9']
      },
      {
        'BBB': ['8', '9']
      },
      {
        'CCC': ['8', '9']
      }
    ]
  },
  {
    'DDD': [
      {
        'AAA': ['8', '9']
      },
      {
        'BBB': ['8', '9']
      },
      {
        'CCC': ['8', '9']
      }
    ]
  },
  {
    'EEE': [
      {
        'AAA': ['8', '9']
      },
      {
        'BBB': ['8', '9']
      },
      {
        'CCC': ['8', '9']
      }
    ]
  },
];

class Brn1RowDelegate implements BrnMultiDataPickerDelegate {
  int firstSelectedIndex = 0;
  int secondSelectedIndex = 0;
  int thirdSelectedIndex = 0;

  Brn1RowDelegate({this.firstSelectedIndex = 0, this.secondSelectedIndex = 0});

  @override
  int numberOfComponent() {
    return 1;
  }

  @override
  int numberOfRowsInComponent(int component) {
    if (0 == component) {
      return list.length;
    } else if (1 == component) {
      Map<String, List> secondMap = list[firstSelectedIndex];
      return secondMap.values.first.length;
    } else {
      Map<String, List> secondMap = list[firstSelectedIndex];
      Map<String, List> thirdMap = secondMap.values.first[secondSelectedIndex];
      return thirdMap.values.first.length;
    }
  }

  @override
  String titleForRowInComponent(int component, int index) {
    if (0 == component) {
      return list[index].keys.first;
    } else if (1 == component) {
      Map<String, List> secondMap = list[firstSelectedIndex];
      List secondList = secondMap.values.first;
      return secondList[index].keys.first;
    } else {
      Map<String, List> secondMap = list[firstSelectedIndex];
      Map<String, List> thirdMap = secondMap.values.first[secondSelectedIndex];
      return thirdMap.values.first[index];
    }
  }

  @override
  double? rowHeightForComponent(int component) {
    return null;
  }

  @override
  selectRowInComponent(int component, int row) {
    if (0 == component) {
      firstSelectedIndex = row;
    } else if (1 == component) {
      secondSelectedIndex = row;
    } else {
      thirdSelectedIndex = row;
      print('_thirdSelectedIndex  is selected to $thirdSelectedIndex');
    }
  }

  @override
  int initSelectedRowForComponent(int component) {
    if (0 == component) {
      return firstSelectedIndex;
    }
    return 0;
  }
}

class Brn2RowDelegate implements BrnMultiDataPickerDelegate {
  int firstSelectedIndex = 0;
  int secondSelectedIndex = 0;
  int thirdSelectedIndex = 0;

  Brn2RowDelegate({this.firstSelectedIndex = 0, this.secondSelectedIndex = 0});

  @override
  int numberOfComponent() {
    return 2;
  }

  @override
  int numberOfRowsInComponent(int component) {
    if (0 == component) {
      return list.length;
    } else if (1 == component) {
      Map<String, List> secondMap = list[firstSelectedIndex];
      return secondMap.values.first.length;
    } else {
      Map<String, List> secondMap = list[firstSelectedIndex];
      Map<String, List> thirdMap = secondMap.values.first[secondSelectedIndex];
      return thirdMap.values.first.length;
    }
  }

  @override
  String titleForRowInComponent(int component, int index) {
    if (0 == component) {
      return list[index].keys.first;
    } else if (1 == component) {
      Map<String, List> secondMap = list[firstSelectedIndex];
      List secondList = secondMap.values.first;
      return secondList[index].keys.first;
    } else {
      Map<String, List> secondMap = list[firstSelectedIndex];
      Map<String, List> thirdMap = secondMap.values.first[secondSelectedIndex];
      return thirdMap.values.first[index];
    }
  }

  @override
  double? rowHeightForComponent(int component) {
    return null;
  }

  @override
  selectRowInComponent(int component, int row) {
    if (0 == component) {
      firstSelectedIndex = row;
    } else if (1 == component) {
      secondSelectedIndex = row;
    } else {
      thirdSelectedIndex = row;
      print('_thirdSelectedIndex  is selected to $thirdSelectedIndex');
    }
  }

  @override
  int initSelectedRowForComponent(int component) {
    if (0 == component) {
      return firstSelectedIndex;
    } else if (1 == component) {
      return secondSelectedIndex;
    } else if (2 == component) {
      print('_thirdSelectedIndex  is selected to $thirdSelectedIndex');
      return thirdSelectedIndex;
    }
    return 0;
  }
}

class Brn3RowDelegate implements BrnMultiDataPickerDelegate {
  int firstSelectedIndex = 0;
  int secondSelectedIndex = 0;
  int thirdSelectedIndex = 0;

  Brn3RowDelegate({
    this.firstSelectedIndex = 0,
    this.secondSelectedIndex = 0,
    this.thirdSelectedIndex = 0,
  });

  @override
  int numberOfComponent() {
    return 3;
  }

  @override
  int numberOfRowsInComponent(int component) {
    if (0 == component) {
      return list.length;
    } else if (1 == component) {
      Map<String, List> secondMap = list[firstSelectedIndex];
      return secondMap.values.first.length;
    } else {
      Map<String, List> secondMap = list[firstSelectedIndex];
      Map<String, List> thirdMap = secondMap.values.first[secondSelectedIndex];
      return thirdMap.values.first.length;
    }
  }

  @override
  String titleForRowInComponent(int component, int index) {
    if (0 == component) {
      return list[index].keys.first;
    } else if (1 == component) {
      Map<String, List> secondMap = list[firstSelectedIndex];
      List secondList = secondMap.values.first;
      //return secondList[index];
      return secondList[index].keys.first;
    } else {
      Map<String, List> secondMap = list[firstSelectedIndex];
      Map<String, List> thirdMap = secondMap.values.first[secondSelectedIndex];
      return thirdMap.values.first[index];
    }
  }

  @override
  double rowHeightForComponent(int component) {
    return 4;
  }

  @override
  selectRowInComponent(int component, int row) {
    if (0 == component) {
      firstSelectedIndex = row;
    } else if (1 == component) {
      secondSelectedIndex = row;
    } else {
      thirdSelectedIndex = row;
      print('_thirdSelectedIndex  is selected to $thirdSelectedIndex');
    }
  }

  @override
  int initSelectedRowForComponent(int component) {
    if (0 == component) {
      return firstSelectedIndex;
    } else if (1 == component) {
      return secondSelectedIndex;
    } else if (2 == component) {
      print('_thirdSelectedIndex  is selected to $thirdSelectedIndex');
      return thirdSelectedIndex;
    }
    return 0;
  }
}
