import 'package:flutter_blcs/common/base_page_widget.dart';

import '../../common/utils/code.dart';
import '../../generated/l10n.dart';

class NetWorkPage extends BasePageWidget {
  static const String keys = "NetWorkPage";
  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.netWork;


  @override
  String? get getDes => netWorkDes;

  @override
  String? get getCode => netWorkCode;

}
