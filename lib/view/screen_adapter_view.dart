import 'package:flutter/material.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/utils/weiget_util.dart';

class ScreenAdapterView extends StatefulWidget {
  const ScreenAdapterView({Key? key}) : super(key: key);

  @override
  _ScreenAdapterViewState createState() => _ScreenAdapterViewState();
}

final String _code = """
""";
class _ScreenAdapterViewState extends State<ScreenAdapterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(S.of(context).screen_adapter),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          printTxt("一、屏幕适配"),
          Padding(padding: EdgeInsets.all(10),
            child: printTxt("object"),
          ),
          printTxt("二、代码如下"),
          printCode(_code)
        ],
      ),
    );
  }
}
