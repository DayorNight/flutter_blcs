import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/bottom_menu.dart';
import 'package:flutter_blcs/common/utils/dialog.dart';
import 'package:flutter_blcs/common/utils/loading.dart';
import 'package:flutter_blcs/common/utils/tips.dart';
import 'package:flutter_blcs/common/utils/toast.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogPage extends StatefulWidget {
  static final String keys = "DialogPage";

  const DialogPage({Key? key}) : super(key: key);

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  String _selection = "Dialog";
  List<String> menus = ["Dialog", "BottomMenu", "Tips", "Loading", "Toast"];

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: '弹窗',
      keys: DialogPage.keys,
      logoColor: Theme.of(context).primaryColor,
      headerChild: Container(
        height: 60.w,
        margin: EdgeInsets.only(bottom: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(_selection),
            PopupMenuButton<String>(
              offset: Offset(60.w, 60.w),
              icon: Icon(Icons.keyboard_arrow_down_sharp),
              onSelected: (String result) {
                setState(() {
                  _selection = result;
                });
              },
              itemBuilder: (BuildContext context) =>
                  menus.map<PopupMenuEntry<String>>((value) {
                return PopupMenuItem<String>(
                  value: value,
                  child: Center(child: Text(value)),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      footerChild: Column(
        children: _listWidget(context),
      ),
    );
  }

  _listWidget(BuildContext context) {
    switch (_selection) {
      case "Dialog":
        return listDialog(context);
      case "BottomMenu":
        return listBottomMenu(context);
      case "Tips":
        return listTips(context);
      case "Loading":
        return listLoading(context);
      case "Toast":
        return listToast(context);
    }
  }

}
