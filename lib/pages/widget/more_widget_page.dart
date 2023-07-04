import 'package:flutter/widgets.dart';
import 'package:flutter_blcs/common/BasePageWidget.dart';
import 'package:flutter_blcs/common/utils/navigator.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/routes/pages.dart';

class MoreWidgetPage extends BasePageWidget {
  static const keys = 'MoreWidgetPage';

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.widget_more_titile;

  final title = moreWidget.keys.toList();
  @override
  Widget? buildBody(BuildContext context) {
    return ListView.builder(
        itemCount:title.length,
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return commonButton(content: title[index], des: '',onTop: (){
            NavigatorUtils.fadePush(context, moreWidget.values.elementAt(index));
          });
        });
  }
}
