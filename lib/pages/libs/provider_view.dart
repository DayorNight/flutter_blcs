import 'package:flutter/material.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/common/utils/code.dart';
import 'package:flutter_blcs/common/weiget_util.dart';

class ProviderView extends StatefulWidget {
  static final String keys = "providerView";
  const ProviderView({Key? key}) : super(key: key);

  @override
  _ProviderViewState createState() => _ProviderViewState();
}

class _ProviderViewState extends State<ProviderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(S.of(context).provider),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          printTxt(providerDes),
          printCode(providerCode),
        ],
      ),
    );
  }
}
