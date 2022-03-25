import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/sp/sp.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/common/sp/sp_keys.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/viewmodel/language_viewmodel.dart';
import 'package:provider/provider.dart';

class SwitchLanguageView extends StatefulWidget {
  static final String keys = "languageView";
  const SwitchLanguageView({Key? key}) : super(key: key);

  @override
  _SwitchLanguageViewState createState() => _SwitchLanguageViewState();
}

class _SwitchLanguageViewState extends State<SwitchLanguageView> {
  late Map _datas;

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(S.of(context).switch_language),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemBuilder: (mContext, index) {
          var check = Provider.of<LanguageViewModel>(context).getLanguage() == _datas.values.elementAt(index);
          return GestureDetector(
            onTap: (){
              String locale =_datas.values.elementAt(index);
              print(locale);
              context.read<LanguageViewModel>().setLanguage(locale);
              Sp.save(SP_INIT_LANGUAGE, locale);
            },
            child: Container(
              decoration: BoxDecoration(
                color: check?Theme.of(context).primaryColor:null,
                borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Text(
                    _datas.keys.elementAt(index),
                    style: TextStyle(fontSize: 19,color: check?Colors.white:Colors.blue),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Visibility(
                    visible: check,
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: _datas.length,
      ),
    );
  }

  void initData() {
    _datas = {"中文": "zh", "English": 'en', "跟随系统": ''};
  }
}
